<div class="product-quantity mt-10 mb-10 d-flex gap-2 align-items-center">
    <input
        class="cart-input form-control"
        type="number"
        name="items[{{ $key }}][values][qty]"
        value="{{ $cartItem->qty }}"
        min="1"
        max="{{ $product->with_storehouse_management ? $product->quantity : 1000 }}"
    />
</div>
