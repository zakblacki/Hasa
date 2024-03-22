<?php

namespace Botble\Satim\Http\Controllers;

use Botble\Payment\Enums\PaymentStatusEnum;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Payment\Supports\PaymentHelper;
use Botble\Satim\Http\Requests\SatimPaymentCallbackRequest;
use Botble\Satim\Services\Gateways\SatimPaymentService;
use Exception;
use Illuminate\Routing\Controller;
use Illuminate\Support\Arr;
use Satim\Checkout\Session;
use Satim\PaymentIntent;
use Illuminate\Http\Request;
use Botble\Ecommerce\Models\Customer;
use Illuminate\Support\Facades\Http;
use Botble\Ecommerce\Models\Order;
use DB;

class SatimController extends Controller
{
    public function success(
        Request $request,
        SatimPaymentService $satimPaymentService,
        BaseHttpResponse $response
    ) {
        try {
            $session = $request->input('session_id');
            session()->setId($session);
            session()->start();    
            $order = Order::where('token','=',$session)->first();
            $chargeId = $request->input('orderId');
            $reqresponse = Http::get($satimPaymentService->satimUrl('confirmOrder.do'), [
                'userName' => setting('payment_satim_client_id'),
                'password' => setting('payment_satim_secret'),
                'orderId' => $chargeId,
                'language' => in_array(strtoupper(app()->getLocale()), ['EN','FR','AR'])?strtoupper(app()->getLocale()):'EN',
            ]);
            $reqresponse = $reqresponse->json();
            
            if ($reqresponse && isset($reqresponse['params']['respCode']) && $reqresponse['params']['respCode'] == "00" && isset($reqresponse['ErrorCode']) && $reqresponse['ErrorCode'] == 0 && isset($reqresponse['OrderStatus']) && $reqresponse['OrderStatus'] == 2 ) {
            // if ($reqresponse && isset($reqresponse['ErrorCode']) && $reqresponse['ErrorCode'] == 3) {
                do_action(PAYMENT_ACTION_PAYMENT_PROCESSED, [
                    'amount' => $reqresponse['Amount'],
                    'currency' => 'DZD',
                    'charge_id' => $chargeId,
                    'order_id' => $order->id,
                    'customer_id' => $order->user_id,
                    'customer_type' => Customer::class,
                    'payment_channel' => SATIM_PAYMENT_METHOD_NAME,
                    'status' => PaymentStatusEnum::COMPLETED,
                ]);
                session()->put('satimpayment_success', true);
                session()->put('satimpayment_data', $reqresponse);
                return $response
                    ->setNextUrl(PaymentHelper::getRedirectURL() . '?charge_id=' . $chargeId)
                    ->setMessage(trans('plugins/satim::satim.checkout_successfully'));
            }elseif(isset($reqresponse['ErrorCode'])){
                $satimError = $reqresponse;
                echo view('plugins/satim::error', compact('satimError'))->render();
                die();
            }else{
                return $response
                    ->setError()
                    ->setNextUrl(route('public.checkout.information', $session))
                    ->withInput()
                    ->setMessage(trans('plugins/satim::satim.payment_failed'));
            }
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setNextUrl(route('public.checkout.information', $session))
                ->withInput()
                ->setMessage($exception->getMessage() ?: trans('plugins/satim::satim.payment_failed'));
        }
    }

    public function error(BaseHttpResponse $response, Request $request)
    {
        if($request->input('session_id')){
            $session = $request->input('session_id');
            session()->setId($session);
            session()->start();
            $chargeId = $request->input('orderId');
            $order = Order::where('token','=',$session)->first();
            do_action(PAYMENT_ACTION_PAYMENT_PROCESSED, [
                'amount' => $order->total,
                'currency' => 'DZD',
                'charge_id' => $chargeId,
                'order_id' => $order->id,
                'customer_id' => $order->user_id,
                'customer_type' => Customer::class,
                'payment_channel' => SATIM_PAYMENT_METHOD_NAME,
                'status' => PaymentStatusEnum::FAILED,
            ]);
        }
        return $response
            ->setError()
            ->setNextUrl(PaymentHelper::getCancelURL())
            ->withInput()
            ->setMessage(trans('plugins/satim::satim.payment_failed!'));
    }
}
