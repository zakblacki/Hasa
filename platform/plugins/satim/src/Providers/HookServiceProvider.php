<?php

namespace Botble\Satim\Providers;

use Botble\Base\Facades\Html;
use Botble\Payment\Enums\PaymentMethodEnum;
use Botble\Payment\Facades\PaymentMethods;
use Botble\Satim\Services\Gateways\SatimPaymentService;
use Illuminate\Http\Request;
use Illuminate\Support\ServiceProvider;
use Botble\Ecommerce\Models\Order;

class HookServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        add_filter(PAYMENT_FILTER_ADDITIONAL_PAYMENT_METHODS, [$this, 'registerSatimMethod'], 1, 2);

        $this->app->booted(function () {
            add_filter(PAYMENT_FILTER_AFTER_POST_CHECKOUT, [$this, 'checkoutWithSatim'], 1, 2);
        });

        add_filter(PAYMENT_METHODS_SETTINGS_PAGE, [$this, 'addPaymentSettings'], 1);

        add_filter(BASE_FILTER_ENUM_ARRAY, function ($values, $class) {
            if ($class == PaymentMethodEnum::class) {
                $values['SATIM'] = SATIM_PAYMENT_METHOD_NAME;
            }
            return $values;
        }, 1, 2);

        add_filter(BASE_FILTER_ENUM_LABEL, function ($value, $class) {
            if ($class == PaymentMethodEnum::class && $value == SATIM_PAYMENT_METHOD_NAME) {
                $value = 'Satim';
            }
            return $value;
        }, 1, 2);

        add_filter(BASE_FILTER_ENUM_HTML, function ($value, $class) {
            if ($class == PaymentMethodEnum::class && $value == SATIM_PAYMENT_METHOD_NAME) {
                $value = Html::tag(
                    'span',
                    PaymentMethodEnum::getLabel($value),
                    ['class' => 'label-success status-label']
                )
                    ->toHtml();
            }
            return $value;
        }, 1, 2);

        add_filter(PAYMENT_FILTER_GET_SERVICE_CLASS, function ($data, $value) {
            if ($value == SATIM_PAYMENT_METHOD_NAME) {
                $data = SatimPaymentService::class;
            }
            return $data;
        }, 1, 2);

        add_filter(PAYMENT_FILTER_PAYMENT_INFO_DETAIL, function ($data, $payment) {
            if ($payment->payment_channel == SATIM_PAYMENT_METHOD_NAME) {
                $paymentDetail = (new SatimPaymentService())->getPaymentDetails($payment->charge_id);
                $data = view('plugins/satim::detail', ['payment' => $paymentDetail])->render();
            }

            return $data;
        }, 1, 2);


        add_filter('ecommerce_checkout_form_after', function () {
            echo "<div class='form-group' id='termsbox'>
                <div class='form-check'>
                    <input class='form-check-input' type='checkbox' id='terms' name='terms' required>
                    <label class='form-check-label' for='terms'>" . trans('plugins/satim::satim.i_agree_to_the'). "<a href='#'>" . trans('plugins/satim::satim.terms_and_conditions'). "</a></label>
                </div>
                </div>";
        });

        add_filter('ecommerce_thank_you_customer_info', function () {
            $order = Order::where('token','=',request()->route()->token)->with(['payment'])->first();
            if(session()->has('satimpayment_success') && session()->get('satimpayment_success') == true && $order->payment->payment_channel == SATIM_PAYMENT_METHOD_NAME){
            // if( $order->payment->payment_channel == SATIM_PAYMENT_METHOD_NAME){
                $order_detail=session()->get('satimpayment_data');
                $chargeId = request()->input('charge_id');
                $msg = '';

                // $msg .= '<script src="https://cdnjs.cloudflare.com/ajax/libs/dompurify/2.3.1/purify.min.js"></script>';
                // $msg .= '<script src="https://unpkg.com/jspdf@latest/dist/jspdf.umd.min.js"></script>';
                // $msg .= '<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>';
                $msg .= '
                <style>
                @media print {
                    .printButtonClass{ display : none }
                }
                </style>
                <script>
                window.onload = function() {
                    var printButton = document.getElementsByClassName("payment-checkout-btn");
                    for (var i = 0; i <script printButton.length; i++) {
                        printButton[i].classList.add("printButtonClass");
                        printButton[i].attr("data-html2canvas-ignore", "true");
                    }
                }
                </script>';

                // function downloadPDF() {
                //     window.jsPDF = window.jspdf.jsPDF;

                //     // Create jsPDF instance
                //     const doc = new jsPDF({
                //         orientation: "landscape",
                //         unit: "px",
                //         format: [window.innerHeight, window.innerWidth],    
                //     });

                //     // Generate PDF from HTML content
                //     html2canvas(document.body).then(canvas => {
                //         // Convert canvas to an image
                //         const imageData = canvas.toDataURL("image/png");
                        
                //         // Add image to the PDF
                //         doc.addImage(imageData, "PNG", -20, -20, doc.internal.pageSize.width, doc.internal.pageSize.height);

                //         // Save the PDF file
                //         doc.save("invoice-INV-'.$order->id.'.pdf");
                //     }).catch(error => {
                //         console.error("Error generating PDF:", error);
                //     });
                //   }
                // </script>            
                // ';
                // $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.status').':</span><span class="order-customer-info-meta">' . isset($order_detail['respCode_desc'])?$order_detail['respCode_desc']:'' . '</span></p>';
                $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.satim_transaction_id').':</span><span class="order-customer-info-meta">' . $chargeId . '</span></p>';
                $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.order_no').':</span><span class="order-customer-info-meta">' . $order->id . '</span></p>';
                $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.satim_approval_code').':</span><span class="order-customer-info-meta">' . $order_detail['approvalCode'] . '</span></p>';
                $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.date_and_time_of_transaction').':</span><span class="order-customer-info-meta">' . $order->created_at . '</span></p>';
                $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.amount').':</span><span class="order-customer-info-meta">' . $order_detail['Amount']/100 . ' DA</span></p>';
                // $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.currency').':</span><span class="order-customer-info-meta">' . isset($order_detail['Currency'])?$order_detail['Currency']:'' . '</span></p>';
                $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.payment_method').':</span><span class="order-customer-info-meta">' . "CIB" . '</span></p>';
                $msg .='<p><span class="d-inline-block" style="color:green;">'.trans('plugins/satim::satim.in_case_of_payment_problem_please_contact_the_toll_free_number_of') . '</span></p> <img class="filter-black" src="' . url('vendor/core/plugins/satim/images/3020.png') . '" alt="satim">';
                $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.thank_you_for_your_purchase').'</span></p>';
                echo $msg;
                $button = '<a data-html2canvas-ignore="true" class="btn btn-primary me-2 printButtonClass" href="#" onclick="print()"> <i class="fa fa-print"></i>' . trans('plugins/ecommerce::order.print_invoice') . '</a> <a data-html2canvas-ignore="true" class="btn btn-info me-2 printButtonClass" href="' . route('payments.satim.invoice',[request()->route()->token,request()->input('charge_id'),"download"]) . '"> <i class="fa fa-download"></i>' . trans('plugins/ecommerce::order.download_invoice') . '</a><a data-html2canvas-ignore="true" class="btn btn-info printButtonClass" href="#" onclick="alert(\'Email Sent\')"> <i class="fa fa-download"></i>' . trans('plugins/contact::contact.tables.email') . '</a>';
                echo $button;
            }
        });
    }

    public function addPaymentSettings(?string $settings): string
    {
        return $settings . view('plugins/satim::settings')->render();
    }

    public function registerSatimMethod(?string $html, array $data): string
    {
        PaymentMethods::method(SATIM_PAYMENT_METHOD_NAME, [
            'html' => view('plugins/satim::methods', $data)->render(),
        ]);

        return $html;
    }

    public function checkoutWithSatim(array $data, Request $request): array
    {
        if ($data['type'] !== SATIM_PAYMENT_METHOD_NAME) {
            return $data;
        }

        $satimPaymentService = $this->app->make(SatimPaymentService::class);

        $currentCurrency = get_application_currency();

        $paymentData = apply_filters(PAYMENT_FILTER_PAYMENT_DATA, [], $request);

        $supportedCurrencies = $satimPaymentService->supportedCurrencyCodes();

        if (! in_array($paymentData['currency'], $supportedCurrencies)) {
            $data['error'] = true;
            $data['message'] = __(
                ":name doesn't support :currency. List of currencies supported by :name: :currencies.",
                [
                    'name' => 'Satim',
                    'currency' => $paymentData['currency'],
                    'currencies' => implode(', ', $supportedCurrencies),
                ]
            );

            return $data;
        }

        $result = $satimPaymentService->execute($paymentData);

        if ($satimPaymentService->getErrorMessage()) {
            $data['error'] = true;
            $data['message'] = $satimPaymentService->getErrorMessage();
        } elseif ($result) {
            $data['checkoutUrl'] = $result;
        }

        return $data;
    }
}
