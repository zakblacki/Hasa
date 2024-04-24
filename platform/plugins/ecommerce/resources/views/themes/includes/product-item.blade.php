@php
    $isConfigurable = $product->variations()->count() > 0;
@endphp

<div class="card product-item">
    <a href="{{ $product->url }}">
        {!! RvMedia::image($product->image, $product->name, 'product-thumb', attributes: ['class' => 'card-img-top']) !!}
    </a>
    <div class="card-body">
        <div class="card-title product-name fw-bold fs-5 mb-3" >
            <a class="text-black" title="{{ $product->name }}" href="{{ $product->url }}">{{ $product->name }}</a>
        </div>

        <div class="product-price-wrapper mb-3">
            <span class="product-price new-price h5 fw-bold text-primary">{{ format_price($product->front_sale_price_with_taxes) }}</span>
            @if ($product->isOnSale())
                <span class="product-price old-price text-black-50 ms-1 fw-medium"><del>{{ format_price($product->price_with_taxes) }}</del></span>
            @endif
        </div>

        @if(EcommerceHelper::isReviewEnabled())
            @include(EcommerceHelper::viewPath('includes.rating'))
        @endif

        <div class="product-add-cart-btn-large-wrapper">
            @if(!$isConfigurable)
                <a
                    class=" btn btn-primary"
                    href="{{ route('public.cart.add-to-cart', $product->id) }}"
                >
                    <x-core::icon name="ti ti-eye"/>

                    {{ __('Buy') }}
                </a>
            @else
                <a
                    class=" btn btn-primary"
                    href="{{ $product->url }}"
                >
                    <x-core::icon name="ti ti-eye"/>

                    {{ __('View') }}
                </a>
            @endif
        </div>
    </div>
</div>
