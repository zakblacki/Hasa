<?php

namespace Botble\Satim\Services\Abstracts;

use Botble\Payment\Services\Traits\PaymentErrorTrait;
use Illuminate\Support\Facades\Http;
use Botble\Ecommerce\Models\Order;
use Exception;
use DB;

abstract class SatimPaymentAbstract
{
    use PaymentErrorTrait;

    protected string|null $token = null;

    protected float $amount;

    protected string $currency;

    protected string $chargeId;

    protected bool $supportRefundOnline = true;

    public function getSupportRefundOnline(): bool
    {
        return $this->supportRefundOnline;
    }

    public function execute(array $data): string|null
    {
        $chargeId = null;

        try {
            $chargeId = $this->makePayment($data);
        } catch (Exception $exception) {
            $this->setErrorMessageAndLogging($exception, 7); // Something else happened, completely unrelated to Satim
        }

        return $chargeId;
    }

    abstract public function makePayment(array $data): string|null;

    public function getPaymentDetails(string $chargeId)
    {
        $reqresponse = Http::get($this->satimUrl('confirmOrder.do'), [
            'userName' => setting('payment_satim_client_id'),
            'password' => setting('payment_satim_secret'),
            'orderId' => $chargeId,
            'language' => in_array(strtoupper(app()->getLocale()), ['EN','FR','AR'])?strtoupper(app()->getLocale()):'EN',
        ]);
        return $reqresponse->json();
    }

    public function satimUrl($point): string
    {
        return $this->satimMode() == 'live' ? 'https://cib.satim.dz/payment/rest/' . $point : 'https://test.satim.dz/payment/rest/' . $point;
    }

    public function setCurrency($currency): static
    {
        $this->currency = $currency;

        return $this;
    }

    public function refundOrder(string $paymentId, float|string $totalAmount, array $options = []): array
    {
        try {
            $response = Http::get($this->satimUrl('refund.do'),[
                'amount' => $totalAmount*100,
                'currency' => 012,
                'orderId' => $paymentId,
                'userName' => setting('payment_satim_client_id'),
                'password' => setting('payment_satim_secret'),
            ]);
            if ($response->successful()) {
                $response = $response->json();
                if ($response['errorCode'] == 0) {
                    return [
                        'error' => false,
                        'message' => $response['errorMessage'],
                    ];
                }
                return [
                    'error' => true,
                    'message' => $response['errorMessage'],
                ];
            }
        } catch (Exception $exception) {
            return [
                'error' => true,
                'message' => $exception->getMessage(),
            ];
        }
    }
}
