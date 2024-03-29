@if (get_payment_setting('status', SSLCOMMERZ_PAYMENT_METHOD_NAME) == 1)
    <li class="list-group-item">
        <input
            class="magic-radio js_payment_method"
            id="payment_{{ SSLCOMMERZ_PAYMENT_METHOD_NAME }}"
            name="payment_method"
            type="radio"
            value="{{ SSLCOMMERZ_PAYMENT_METHOD_NAME }}"
            @if ($selecting == SSLCOMMERZ_PAYMENT_METHOD_NAME) checked @endif
        >
        <label
            for="payment_{{ SSLCOMMERZ_PAYMENT_METHOD_NAME }}">{{ get_payment_setting('name', SSLCOMMERZ_PAYMENT_METHOD_NAME, __('Payment with :paymentType', ['paymentType' => 'SslCommerz'])) }}</label>
        <div
            class="payment_{{ SSLCOMMERZ_PAYMENT_METHOD_NAME }}_wrap payment_collapse_wrap collapse @if ($selecting == SSLCOMMERZ_PAYMENT_METHOD_NAME) show @endif">
            <p>{!! get_payment_setting(
                'description',
                SSLCOMMERZ_PAYMENT_METHOD_NAME,
                __('The largest payment gateway aggregator in Bangladesh and a pioneer in the FinTech industry since 2010'),
            ) !!}</p>
        </div>
    </li>
@endif
