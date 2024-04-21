<?php

namespace Botble\Satim\Services\Abstracts;

use Botble\Payment\Services\Traits\PaymentErrorTrait;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
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
        try{
            $reqresponse = Http::get($this->satimUrl('confirmOrder.do'), [
                'userName' => setting('payment_satim_client_id'),
                'password' => setting('payment_satim_secret'),
                'orderId' => $chargeId,
                'language' => in_array(strtoupper(app()->getLocale()), ['EN','FR','AR'])?strtoupper(app()->getLocale()):'EN',
            ]);
            Log::debug('-----Satim confirmOrder.do (admin transaction page) url: ' . $reqresponse->transferStats->getEffectiveUri()->__toString());
            Log::debug('-----Satim confirmOrder.do (admin transaction page) Start--------');
            Log::debug($reqresponse->json());
            Log::debug('-----Satim confirmOrder.do (admin transaction page) End----------');
            return $reqresponse->json();
        }catch (Exception $exception){
            return [
                'error' => true,
                'message' => $exception->getMessage(),
            ];
        }
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
            Log::debug('-----Satim refund.do (admin order page) url: ' . $response->transferStats->getEffectiveUri()->__toString());
            Log::debug('-----Satim refund.do (admin order page) Start--------');
            Log::debug($response->json());
            Log::debug('-----Satim refund.do (admin order page) End----------');
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
