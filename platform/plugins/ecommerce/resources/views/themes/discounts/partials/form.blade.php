@if ($discounts->isNotEmpty())
    <div class="checkout__coupon-section">
        <div class="checkout__coupon-heading">
            <img alt="MÃ GIẢM GIÁ" width="32" height="32" src="{{ asset('vendor/core/plugins/ecommerce/images/code_dis.gif') }}">
            {{ __('Coupon codes (:count)', ['count' => $discounts->count()]) }}
        </div>

        <div class="checkout__coupon-list">
            @foreach ($discounts as $discount)
                <div
                    @class(['checkout__coupon-item', 'active' => session()->has('applied_coupon_code') && session()->get('applied_coupon_code') === $discount->code])
                >
                    <div class="checkout__coupon-item-icon"></div>
                    <div class="checkout__coupon-item-content">
                        <div class="checkout__coupon-item-title">
                            <h4>{{ $discount->type_option === 'amount' ? format_price($discount->value) : $discount->value . '%' }}</h4>
                            @if($discount->quantity > 0)
                                <span class="checkout__coupon-item-count">
                                    ({{ __('Left :left', ['left' => $discount->left_quantity]) }})
                                </span>
                            @endif
                        </div>
                        <div class="checkout__coupon-item-description">
                            {{ $discount->description ?: get_discount_description($discount) }}
                        </div>
                        <div class="checkout__coupon-item-code">
                            <span>{{ $discount->code }}</span>
                            @if (!session()->has('applied_coupon_code') || session()->get('applied_coupon_code') !== $discount->code)
                                <button type="button" data-bb-toggle="apply-coupon-code" data-discount-code="{{ $discount->code }}">
                                    {{ __('Apply') }}
                                </button>
                            @else
                                <button type="button" class="remove-coupon-code" data-url="{{ route('public.coupon.remove') }}">
                                    {{ __('Remove') }}
                                </button>
                            @endif
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
@endif

<div
    class="checkout-discount-section"
    @if (session()->has('applied_coupon_code')) style="display: none;" @endif
>
    <a class="btn-open-coupon-form" href="#">
        {{ __('You have a coupon code?') }}
    </a>
</div>
<div
    class="coupon-wrapper mt-2"
    @if (!session()->has('applied_coupon_code')) style="display: none;" @endif
>
    @if (!session()->has('applied_coupon_code'))
        @include('plugins/ecommerce::themes.discounts.partials.apply-coupon')
    @else
        @include('plugins/ecommerce::themes.discounts.partials.remove-coupon')
    @endif
</div>
<div class="clearfix"></div>
