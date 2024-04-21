<span class="d-block">{{ $product->name }}</span>
<span class="d-block text-muted">{{ $product->sku ?: '-' }}</span>

@if ($product->is_variation && $product->variation_attributes)
    <span class="d-block text-success">{{ $product->variation_attributes }}</span>
@endif
