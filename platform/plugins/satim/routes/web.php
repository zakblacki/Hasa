<?php

use Illuminate\Support\Facades\Route;
use Barryvdh\DomPDF\Facade\Pdf;
use Barryvdh\DomPDF\PDF as PDFHelper;
use Carbon\Carbon;
use Dompdf\Dompdf;
use Botble\Ecommerce\Models\Order;
use Botble\Ecommerce\Facades\InvoiceHelper;
use Botble\Ecommerce\Facades\OrderHelper;
use Botble\Ecommerce\Models\Invoice;

Route::group(['namespace' => 'Botble\Satim\Http\Controllers', 'middleware' => ['web', 'core']], function () {
    Route::group(apply_filters(BASE_FILTER_GROUP_PUBLIC_ROUTE, []), function () {

        Route::get('payment/satim/success', 'SatimController@success')->name('payments.satim.success');
        Route::get('payment/satim/error', 'SatimController@error')->name('payments.satim.error');



        
        Route::get('payment/satim/sendmai', function(){
            $order = Order::where('id','=',134)->with(['payment','address','user'])->first();
            
            // dd($order);


            add_filter('base_filter_email_template_footer', function () {
                // if( $order->payment->payment_channel == SATIM_PAYMENT_METHOD_NAME){
                    $order_detail=session()->get('satimpayment_data');
                    $msg = '';
                    // $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.status').':</span><span class="order-customer-info-meta">' . isset($order_detail['respCode_desc'])?$order_detail['respCode_desc']:'' . '</span></p>';
                    $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.satim_transaction_id').':</span><span class="order-customer-info-meta">Test 1</span></p>';
                    $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.order_no').':</span><span class="order-customer-info-meta">Test 1</span></p>';
                    $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.satim_approval_code').':</span><span class="order-customer-info-meta">Test 1</span></p>';
                    $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.date_and_time_of_transaction').':</span><span class="order-customer-info-meta">Test 1</span></p>';
                    $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.amount').':</span><span class="order-customer-info-meta">Test 1</span></p>';
                    // $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.currency').':</span><span class="order-customer-info-meta">' . isset($order_detail['Currency'])?$order_detail['Currency']:'' . '</span></p>';
                    $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.payment_method').':</span><span class="order-customer-info-meta">Test 1</span></p>';
                    $msg .='<p><span class="d-inline-block"  style="color:green;">'.trans('plugins/satim::satim.in_case_of_payment_problem_please_contact_the_toll_free_number_of') . '</span> </p><img class="filter-black" src="' . url('vendor/core/plugins/satim/images/3020.png') . '" alt="satim">';
                    $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.thank_you_for_your_purchase').'</span></p>';
                    return $msg;
                    // $button = '<a data-html2canvas-ignore="true" class="btn btn-primary me-2 printButtonClass" href="#" target="_blank" onclick="window.print(false);" > <i class="fa fa-print"></i>' . trans('plugins/ecommerce::order.print_invoice') . '</a> <a data-html2canvas-ignore="true" class="btn btn-info printButtonClass" href="#" onclick="downloadPDF()"> <i class="fa fa-download"></i>' . trans('plugins/ecommerce::order.download_invoice') . '</a><a data-html2canvas-ignore="true" class="btn btn-info printButtonClass" href="#"> <i class="fa fa-download"></i>' . trans('plugins/contact::contact.tables.email') . '</a>';
                    // echo $button;
            });

            



            return OrderHelper::sendOrderConfirmationEmail($order,true);
        })->name('payments.satim.callback');



        Route::get('payment/staim/download/{token}/{chargeId}/{type}', function($token,$chargeId,$type){
            $order = Order::query()
                ->where('token', $token)
                ->with(['payment', 'invoice'])
                ->orderByDesc('id')
                ->first();

            if (! $order) {
                abort(404);
            }


            add_filter('invoice_payment_info_filter', function () {
                $order = Order::where('token','=',request()->route()->token)->with(['payment'])->first();
                if(session()->has('satimpayment_success') && session()->get('satimpayment_success') == true && $order->payment->payment_channel == SATIM_PAYMENT_METHOD_NAME){
                // if( $order->payment->payment_channel == SATIM_PAYMENT_METHOD_NAME){
                    $order_detail=session()->get('satimpayment_data');
                    $msg = '';
                    // $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.status').':</span><span class="order-customer-info-meta">' . isset($order_detail['respCode_desc'])?$order_detail['respCode_desc']:'' . '</span></p>';
                    $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.satim_transaction_id').':</span><span class="order-customer-info-meta">' . request()->route()->chargeId . '</span></p>';
                    $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.order_no').':</span><span class="order-customer-info-meta">' . session()->get('satimOrderNo') . '</span></p>';
                    $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.satim_approval_code').':</span><span class="order-customer-info-meta">' . $order_detail['approvalCode'] . '</span></p>';
                    $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.date_and_time_of_transaction').':</span><span class="order-customer-info-meta">' . $order->created_at . '</span></p>';
                    $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.amount').':</span><span class="order-customer-info-meta">' . $order_detail['Amount']/100 . ' DA</span></p>';
                    // $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.currency').':</span><span class="order-customer-info-meta">' . isset($order_detail['Currency'])?$order_detail['Currency']:'' . '</span></p>';
                    $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.payment_method').':</span><span class="order-customer-info-meta">' . "CIB" . '</span></p>';
                    $msg .='<p><span class="d-inline-block"  style="color:green;">'.trans('plugins/satim::satim.in_case_of_payment_problem_please_contact_the_toll_free_number_of') . '</span> </p><img class="filter-black" src="' . url('vendor/core/plugins/satim/images/3020.png') . '" alt="satim">';
                    $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.thank_you_for_your_purchase').'</span></p>';
                    return $msg;
                    // $button = '<a data-html2canvas-ignore="true" class="btn btn-primary me-2 printButtonClass" href="#" target="_blank" onclick="window.print(false);" > <i class="fa fa-print"></i>' . trans('plugins/ecommerce::order.print_invoice') . '</a> <a data-html2canvas-ignore="true" class="btn btn-info printButtonClass" href="#" onclick="downloadPDF()"> <i class="fa fa-download"></i>' . trans('plugins/ecommerce::order.download_invoice') . '</a><a data-html2canvas-ignore="true" class="btn btn-info printButtonClass" href="#"> <i class="fa fa-download"></i>' . trans('plugins/contact::contact.tables.email') . '</a>';
                    // echo $button;
                }
            });

            

            // $pdf = PDF::loadView('plugins/ecommerce::orders.thank-you', compact('order', 'products'));

            if(request()->has('mail')){
                add_filter('BASE_FILTER_EMAIL_TEMPLATE_FOOTER', function () {
                    add_filter('invoice_payment_info_filter', function () {
                        $order = Order::where('token','=',request()->route()->token)->with(['payment'])->first();
                        // if(session()->has('satimpayment_success') && session()->get('satimpayment_success') == true && $order->payment->payment_channel == SATIM_PAYMENT_METHOD_NAME){
                        // if( $order->payment->payment_channel == SATIM_PAYMENT_METHOD_NAME){
                            $order_detail=session()->get('satimpayment_data');
                            $msg = '';
                            // $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.status').':</span><span class="order-customer-info-meta">' . isset($order_detail['respCode_desc'])?$order_detail['respCode_desc']:'' . '</span></p>';
                            $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.satim_transaction_id').':</span><span class="order-customer-info-meta">' . request()->route()->chargeId . '</span></p>';
                            $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.order_no').':</span><span class="order-customer-info-meta">' . session()->get('satimOrderNo') . '</span></p>';
                            $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.satim_approval_code').':</span><span class="order-customer-info-meta">' . $order_detail['approvalCode'] . '</span></p>';
                            $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.date_and_time_of_transaction').':</span><span class="order-customer-info-meta">' . $order->created_at . '</span></p>';
                            $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.amount').':</span><span class="order-customer-info-meta">' . $order_detail['Amount']/100 . ' DA</span></p>';
                            // $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.currency').':</span><span class="order-customer-info-meta">' . isset($order_detail['Currency'])?$order_detail['Currency']:'' . '</span></p>';
                            $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.payment_method').':</span><span class="order-customer-info-meta">' . "CIB" . '</span></p>';
                            $msg .='<p><span class="d-inline-block"  style="color:green;">'.trans('plugins/satim::satim.in_case_of_payment_problem_please_contact_the_toll_free_number_of') . '</span></p><img class="filter-black" src="' . url('vendor/core/plugins/satim/images/3020.png') . '" alt="satim">';
                            $msg .='<p><span class="d-inline-block">'.trans('plugins/satim::satim.thank_you_for_your_purchase').'</span></p>';
                            return $msg;
                            // $button = '<a data-html2canvas-ignore="true" class="btn btn-primary me-2 printButtonClass" href="#" target="_blank" onclick="window.print(false);" > <i class="fa fa-print"></i>' . trans('plugins/ecommerce::order.print_invoice') . '</a> <a data-html2canvas-ignore="true" class="btn btn-info printButtonClass" href="#" onclick="downloadPDF()"> <i class="fa fa-download"></i>' . trans('plugins/ecommerce::order.download_invoice') . '</a><a data-html2canvas-ignore="true" class="btn btn-info printButtonClass" href="#"> <i class="fa fa-download"></i>' . trans('plugins/contact::contact.tables.email') . '</a>';
                            // echo $button;
                        // }
                    });
                });
                return OrderHelper::sendOrderConfirmationEmail($order,true);
            }
            else if(request()->has('print')){
                return InvoiceHelper::streamInvoice($order->invoice);
            }else{
                return InvoiceHelper::downloadInvoice($order->invoice);
            }
            // return $pdf->download('invoice.pdf');
        })->name('payments.satim.invoice');
    });
});
