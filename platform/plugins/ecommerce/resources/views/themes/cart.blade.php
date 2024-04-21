<section class="cart-area pt-50 pb-50">
    <div class="container">
        @if ($products->isNotEmpty())
            <div class="row">
                <div class="col-xl-9 col-lg-8">
                    <x-core::form method="POST" :url="route('public.cart.update')" class="mw-100 overflow-x-auto">
                        <div class="cart-list mb-25 mr-30">
                            <table class="table">
                                <thead class="bg-secondary-subtle">
                                <tr>
                                    <th colspan="2" class="cart-header-product">{{ __('Product') }}</th>
                                    <th class="cart-header-price">{{ __('Price') }}</th>
                                    <th class="cart-header-quantity">{{ __('Quantity') }}</th>
                                    <th class="cart-header-total">{{ __('Total') }}</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach(Cart::instance('cart')->content() as $key => $cartItem)
                                    @php
                                        $product = $products->find($cartItem->id);
                                    @endphp

                                    @continue(empty($product))

                                    <tr>
                                        <input type="hidden" name="items[{{ $key }}][rowId]" value="{{ $cartItem->rowId }}">

                                        <td class="cart-img">
                                            <a href="{{ $product->original_product->url }}">
                                                {{ RvMedia::image($cartItem->options['image'], $product->original_product->name, 'thumb') }}
                                            </a>
                                        </td>
                                        <td class="ps-3 align-middle">
                                            <div class="cart-title">
                                                <a href="{{ $product->original_product->url }}" class="ms-0">{{ $product->original_product->name }}</a>
                                                <span @class(['small', 'text-danger' => $product->isOutOfStock(), 'text-success' => ! $product->isOutOfStock()])>
                                                        @if ($product->isOutOfStock())
                                                        ({{ __('Out of stock') }})
                                                    @else
                                                        ({{ __('In stock') }})
                                                    @endif
                                                    </span>
                                            </div>

                                            @if (is_plugin_active('marketplace') && $product->original_product->store->id)
                                                <div class="small">
                                                    <span>{{ __('Vendor:') }}</span>
                                                    <a href="{{ $product->original_product->store->url }}" class="fw-medium">{{ $product->original_product->store->name }}</a>
                                                </div>
                                            @endif

                                            <div class="small">{{ $cartItem->options['attributes'] ?? '' }}</div>

                                            @if (EcommerceHelper::isEnabledProductOptions() && !empty($cartItem->options['options']))
                                                {!! render_product_options_html($cartItem->options['options'], $product->front_sale_price_with_taxes) !!}
                                            @endif

                                            @include(
                                                EcommerceHelper::viewPath('includes.cart-item-options-extras'),
                                                ['options' => $cartItem->options]
                                            )
                                        </td>
                                        <td class="cart-price align-middle">
                                            <span class="fw-medium fs-5">{{ format_price($product->front_sale_price_with_taxes) }}</span>
                                            @if ($product->isOnSale())
                                                <del class="text-muted">{{ format_price($product->price_with_taxes) }}</del>
                                            @endif
                                        </td>
                                        <td class="cart-quantity align-middle">
                                            @include(EcommerceHelper::viewPath('includes.cart-quantity'))
                                        </td>
                                        <td class="cart-total align-middle">
                                            <span class="fw-medium fs-5">{{ format_price($cartItem->price * $cartItem->qty) }}</span>
                                        </td>
                                        <td class="cart-action align-middle">
                                            <a
                                                class="btn btn-danger btn-icon"
                                                href="{{ route('public.cart.remove', $cartItem->rowId) }}"
                                                {!! EcommerceHelper::getGtmAttributes('remove-from-cart', $product, ['data-product-quantity' => $cartItem->qty]) !!}
                                            >
                                                <svg width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                        fill-rule="evenodd"
                                                        clip-rule="evenodd"
                                                        d="M9.53033 1.53033C9.82322 1.23744 9.82322 0.762563 9.53033 0.46967C9.23744 0.176777 8.76256 0.176777 8.46967 0.46967L5 3.93934L1.53033 0.46967C1.23744 0.176777 0.762563 0.176777 0.46967 0.46967C0.176777 0.762563 0.176777 1.23744 0.46967 1.53033L3.93934 5L0.46967 8.46967C0.176777 8.76256 0.176777 9.23744 0.46967 9.53033C0.762563 9.82322 1.23744 9.82322 1.53033 9.53033L5 6.06066L8.46967 9.53033C8.76256 9.82322 9.23744 9.82322 9.53033 9.53033C9.82322 9.23744 9.82322 8.76256 9.53033 8.46967L6.06066 5L9.53033 1.53033Z"
                                                        fill="currentColor"
                                                    />
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                        <button class="btn btn-primary text-end" type="submit">{{ __('Update cart') }}</button>
                    </x-core::form>
                    <div class="cart-bottom mt-4 mb-4">
                        <div class="cart-coupon row">
                            <div class="col-lg-6">
                                <x-core::form :url="route('public.coupon.apply')" method="post" id="counpon-form">
                                    <div class="input-group mb-3 w-auto">
                                        <input type="text" class="form-control" name="coupon_code" placeholder="{{ __('Enter Coupon Code') }}" value="{{ BaseHelper::stringify(old('coupon_code', session('applied_coupon_code'))) }}">
                                        <button class="btn btn-primary" type="submit" @disabled(session('applied_coupon_code'))>{{ __('Apply') }}</button>
                                    </div>
                                </x-core::form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-4 col-md-6">
                    <div class="card p-4">
                        <div class="cart-checkout-top d-flex align-items-center justify-content-between pb-2 border-bottom mb-2">
                            <span class="cart-checkout-top-title fs-5 fw-bold">{{ __('Subtotal') }}</span>
                            <span class="cart-checkout-top-price fs-5 fw-bold">{{ format_price(Cart::instance('cart')->rawSubTotal()) }}</span>
                        </div>
                        @if (EcommerceHelper::isTaxEnabled())
                            <div class="cart-checkout-tax d-flex align-items-center justify-content-between mb-2 text-muted">
                                <span class="cart-checkout-tax-title">{{ __('Tax') }}</span>
                                <span class="cart-checkout-tax-price">{{ format_price(Cart::instance('cart')->rawTax()) }}</span>
                            </div>
                        @endif
                        @if ($couponDiscountAmount > 0 && session('applied_coupon_code'))
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <div>
                                    {{ __('Coupon') }}
                                    <span class="small">({{ session('applied_coupon_code') }})</span>
                                    <a class="small btn-link text-danger lh-1" data-bb-toggle="remove-coupon" href="{{ route('public.coupon.remove') }}">{{ __('Remove') }}</a>
                                </div>
                                <span>{{ format_price($couponDiscountAmount) }}</span>
                            </div>
                        @endif
                        @if ($promotionDiscountAmount)
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <span>{{ __('Promotion') }}</span>
                                <span>{{ format_price($promotionDiscountAmount) }}</span>
                            </div>
                        @endif
                        <div class="cart-checkout-total d-flex align-items-center justify-content-between mt-3 mb-0">
                            <span class="fs-5 fw-bold">{{ __('Total') }}</span>
                            <span class="fs-5 fw-bold">{{ ($promotionDiscountAmount + $couponDiscountAmount) > Cart::instance('cart')->rawTotal() ? format_price(0) : format_price(Cart::instance('cart')->rawTotal() - $promotionDiscountAmount - $couponDiscountAmount) }}</span>
                        </div>
                        <small class="small">{{ __('(Shipping fees not included)') }}</small>
                        <div class="cart-checkout-proceed mt-3">
                            <a href="{{ route('public.checkout.information', OrderHelper::getOrderSessionToken()) }}" class="cart-checkout-btn w-100 btn btn-primary">
                                {{ __('Proceed to Checkout') }}
                            </a>
                        </div>

                        <a href="{{ route('public.products') }}" class="btn-link d-block text-center mt-3">
                            {{ __('Continue Shopping') }}
                        </a>
                    </div>
                </div>
            </div>
        @else
            <div class="text-center pt-50">
                <h3 class="mb-3">{{ __('Your cart is empty') }}</h3>
                <p class="mb-3">{{ __('Explore and add items to get started') }}</p>
                <a href="{{ route('public.products') }}" class="btn btn-outline-primary btn-sm">{{ __('Start Shopping') }}</a>
            </div>
        @endif
    </div>
</section>
