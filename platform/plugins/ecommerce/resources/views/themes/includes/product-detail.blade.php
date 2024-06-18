<div class="container" id="product-detail">
    <div class="row">
        <div class="col-lg-6 col-md-6 col-sm-12 mb-30">
            @include(EcommerceHelper::viewPath('includes.product-gallery'))
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 mb-30">
            <div class="product-page-content">
                <h2 class="product-title mb-2">{{ $product->name }}</h2>
                @if (EcommerceHelper::isReviewEnabled())
                    @include(EcommerceHelper::viewPath('includes.rating'))
                @endif
                <div class="product-price mb-3">
                    @if ($product->front_sale_price !== $product->price)
                        <del>{{ format_price($product->front_sale_price) }}</del>
                        <span>
                            <span class="product-price-text fw-bold fs-4 text-primary">{{ format_price($product->front_sale_price) }}</span>
                        </span>
                    @else
                        <span>
                            <span class="product-price-text fw-bold fs-4 text-primary">{{ format_price($product->price) }}</span>
                        </span>
                    @endif
                </div>

                {!! apply_filters('ecommerce_before_product_description', null, $product) !!}
                <p
                    class="product-description"
                    id="detail-description"
                >
                    {!! $product->description !!}
                </p>
                {!! apply_filters('ecommerce_after_product_description', null, $product) !!}

                <div class="text-warning"></div>
                <div class="row product-filters">
                    @if ($product->variations()->count() > 0)
                        {!! render_product_swatches($product, [
                            'selected' => $selectedAttrs,
                        ]) !!}
                    @endif
                </div>
                <form class="single-variation-wrap" action="{{ route('public.cart.add-to-cart') }}" method="post">
                    @csrf
                    {!! apply_filters(ECOMMERCE_PRODUCT_DETAIL_EXTRA_HTML, null) !!}
                    <input
                        id="hidden-product-is_out_of_stock"
                        name="product_is_out_of_stock"
                        type="hidden"
                        value="{{ $product->isOutOfStock() }}"
                    />
                    <input
                        id="hidden-product-id"
                        name="id"
                        type="hidden"
                        value="{{ $product->id }}"
                    />
                    <div class="product-quantity mb-3">
                    <span
                        class="quantity-btn quantityPlus"
                        data-value="+"
                    ></span>
                        <input
                            class="quantity input-lg form-control w-auto"
                            name="qty"
                            type="number"
                            value="1"
                            title="Quantity"
                            step="1"
                            min="1"
                            max="20"
                        />
                        <span
                            class="quantity-btn quantityMinus"
                            data-value="-"
                        ></span>
                    </div>
                    <button
                        class="btn btn-primary mb-3"
                        id="btn-add-cart"
                        type="submit"
                    >
                        <x-core::icon name="ti ti-shopping-cart-plus"/>
                    {{ __('Add to cart') }}
                    </button>
                </form>
                <div class="product-meta">
                    @if ($product->sku)
                        <span>{{ __('SKU') }} : <span
                                class="sku"
                                id="product-sku"
                                itemprop="sku"
                            >{{ $product->sku }}</span></span>
                    @endif
                    <span>
                    <span
                        id="is-out-of-stock">{{ !$product->isOutOfStock() ? __('In stock') : __('Out of stock') }}</span>
                </span>

                    @if (!$product->categories->isEmpty())
                        <span>{{ __('Categories') }} :
                        @foreach ($product->categories as $category)
                                <a href="{{ $category->url }}"> {{ $category->name }}
                                    @if (!$loop->last), @endif
                            </a>
                            @endforeach
                    </span>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
