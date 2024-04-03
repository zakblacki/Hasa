@if (setting('payment_satim_status') == 1)
    <li class="list-group-item">
        <input
            class="magic-radio js_payment_method"
            id="payment_satim"
            name="payment_method"
            type="radio"
            value="satim"
            @if ($selecting == SATIM_PAYMENT_METHOD_NAME) checked @endif
        >
        <label
            class="text-start"
            for="payment_satim"
        >
            {{ setting('payment_satim_name', trans('plugins/payment::payment.payment_via_card')) }}
        </label>
        <div
            class="payment_satim_wrap payment_collapse_wrap collapse @if ($selecting == SATIM_PAYMENT_METHOD_NAME) show @endif"
            style="padding: 15px 0;"
        >
            
        
        @if (setting('enable_captcha') && is_plugin_active('captcha'))
        <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit&hl={{app()->getLocale()}}"></script>

                        <div class="mb-3">
                            <div id="satim-captcha"></div>
                        </div>

                        <script>


    $(document).on("change", ".js_payment_method", function (e) {
        if ($(this).val() === 'satim') {
            renderCaptcha();
            $('#termsbox').show();
            document.querySelector(".payment-checkout-btn").style = "text-align: left;background-image: url('https://matacor.com/vendor/core/plugins/satim/images/satim_btn.png'); background-size: 45px 45px; color: #fff; height: 50px; width: 150px; background-position-x: right; background-repeat: no-repeat; background-position-y: center;";                        
        } else {
            clearCaptcha();
            $('#termsbox').hide();
            document.querySelector(".payment-checkout-btn").style = "background-image: none; color: #fff;";                        
        }
    });

    document.addEventListener("payment-form-reloaded", function () {
        var paymentMethod = $("input[name=payment_method]:checked").val();
        if (paymentMethod === "satim") {
            renderCaptcha();
            $('#termsbox').show();
            document.querySelector(".payment-checkout-btn").style = "text-align: left;background-image: url('https://matacor.com/vendor/core/plugins/satim/images/satim_btn.png'); background-size: 45px 45px; color: #fff; height: 50px; width: 150px; background-position-x: right; background-repeat: no-repeat; background-position-y: center;";                        
        }else{
            clearCaptcha();
            $('#termsbox').hide();
            document.querySelector(".payment-checkout-btn").style = "background-image: none; color: #fff;";                        
        }
    });

     function onloadCallback() {
    // Check on page load
    if ($('#payment_satim').is(':checked')) {
        renderCaptcha();
        $('#termsbox').show();
        document.querySelector(".payment-checkout-btn").style = "text-align: left; background-image: url('https://matacor.com/vendor/core/plugins/satim/images/satim_btn.png'); background-size: 45px 45px; color: #fff; height: 50px; width: 150px; background-position-x: right; background-repeat: no-repeat; background-position-y: center;";                        
        
    }
}


function isCaptchaValid() {
    if (typeof grecaptcha !== 'undefined') {
        return grecaptcha.getResponse().length !== 0;
    }
    return false;
}

function renderCaptcha() {
    // render captcha
    if (typeof grecaptcha !== 'undefined') {
        grecaptcha.render('satim-captcha', {
            'sitekey': '{{ setting('captcha_site_key') }}',
            'theme': 'light',
        });
    }
}

function clearCaptcha(){
    if (typeof grecaptcha !== 'undefined') {
        // check if captcha is rendered
        if ($('#satim-captcha').children().length) {
            grecaptcha.reset();
        }else{
            $('#satim-captcha').html('');
        }
    }
}

                        </script>
            @endif
            @php $supportedCurrencies = (new \Botble\Satim\Services\Gateways\SatimPaymentService)->supportedCurrencyCodes(); @endphp
            @if (
                !in_array(get_application_currency()->title, $supportedCurrencies) &&
                    !get_application_currency()->replicate()->newQuery()->where('title', 'USD')->exists())
                <div
                    class="alert alert-warning"
                    style="margin-top: 15px;"
                >
                    {{ __(":name doesn't support :currency. List of currencies supported by :name: :currencies.", ['name' => 'Satim', 'currency' => get_application_currency()->title, 'currencies' => implode(', ', $supportedCurrencies)]) }}
                    @php
                        $currencies = get_all_currencies();
                        
                        $currencies = $currencies->filter(function ($item) use ($supportedCurrencies) {
                            return in_array($item->title, $supportedCurrencies);
                        });
                    @endphp
                    @if (count($currencies))
                        <div style="margin-top: 10px;">
                            {{ __('Please switch currency to any supported currency') }}:&nbsp;&nbsp;
                            @foreach ($currencies as $currency)
                                <a
                                    href="{{ route('public.change-currency', $currency->title) }}"
                                    @if (get_application_currency_id() == $currency->id) class="active" @endif
                                ><span>{{ $currency->title }}</span></a>
                                @if (!$loop->last)
                                    &nbsp; | &nbsp;
                                @endif
                            @endforeach
                        </div>
                    @endif
                </div>
            @endif
        </div>
    </li>
@endif
