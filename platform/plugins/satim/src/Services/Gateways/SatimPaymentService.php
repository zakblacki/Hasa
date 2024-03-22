<?php

namespace Botble\Satim\Services\Gateways;

use Botble\Payment\Enums\PaymentStatusEnum;
use Botble\Satim\Services\Abstracts\SatimPaymentAbstract;
use Exception;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Http;
use Botble\Ecommerce\Models\Customer;
use Illuminate\Support\Str;

class SatimPaymentService extends SatimPaymentAbstract
{
    public function makePayment(array $data): string|null
    {
        $request = request();
        $this->amount = $data['amount'];
        $this->currency = strtoupper($data['currency']);
        try {
            $order = $data['order_id'][0] . "_" . Str::random(10);
            $response = Http::get($this->satimUrl('register.do'), [
                'userName' => setting('payment_satim_client_id'),
                'password' => setting('payment_satim_secret'),
                'orderNumber' => $order,
                'amount' => $this->amount*100,
                'currency' => "012",
                'returnUrl' => route('payments.satim.success', ['session_id' => $data['checkout_token']]),
                // 'failUrl' => route('payments.satim.error', ['session_id' => $data['checkout_token']]),
                'description' => 'Order #' . $data['order_id'][0],
                'language' => in_array(strtoupper(app()->getLocale()), ['EN','FR','AR'])?strtoupper(app()->getLocale()):'EN',
                'jsonParams' => json_encode([
                    'force_terminal_id' => setting('payment_satim_force_terminal_id'),
                    'udf1' => $order,
                ]),
            ]);
            if ($response->successful()) {
               try{
                $jsonBody = $response->json();
                $url = isset($jsonBody['formUrl']) ? $jsonBody['formUrl'] : null;
                
                if($jsonBody && isset($jsonBody['errorCode']) && $jsonBody['errorCode'] == 1){
                    throw new Exception($jsonBody['errorMessage']);
                }
                if ($url) {
                    Log::error('Satim Url: ' . $url);
                    return $url;
                }
               }catch(Exception $error){
                $satimError = $response->json();
                Log::error('Satim payment error: ' . $es->getMessage());
                echo view('plugins/satim::error', compact('satimError'))->render();
                die();
                // throw new Exception('Satim payment error');
                // return null;
               }
            }
            $error = $response->json();
            echo view('plugins/satim::error', compact('error'))->render();
            die();
            // throw new Exception('Satim payment error');
            // return null;
        } catch (Exception $e) {
            Log::error('Satim payment error: ' . $e->getMessage());
            $error = "An error occurred while processing your payment.";
            echo view('plugins/satim::error', compact('error'))->render();
            die();
            // Log::error('Satim payment error: ' . $e->getMessage());
            // throw new Exception('Satim payment error');
            // return null;
        }
    }

    public function satimMode(): string
    {
        $key = 'mode';
        return get_payment_setting('payment_type', SATIM_PAYMENT_METHOD_NAME, $key);
    }

    public function supportedCurrencyCodes(): array
    {
        return [
            'DZD',
        ];
    }
}
