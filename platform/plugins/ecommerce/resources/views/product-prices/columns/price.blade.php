<input
    type="number"
    value="{{ $product->getAttribute($type) ?: 0 }}"
    class="form-control"
    data-bb-toggle="product-bulk-change"
    data-url="{{ route('ecommerce.product-prices.update', ['product' => $product->getKey()]) }}"
    data-column="{{ $type }}"
    data-id="product-price-{{ $type }}-{{ $product->getKey() }}"
/>
