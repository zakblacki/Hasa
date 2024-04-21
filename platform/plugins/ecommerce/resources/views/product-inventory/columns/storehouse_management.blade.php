<x-core::form.select
    data-bb-toggle="product-bulk-change"
    data-url="{{ route('ecommerce.product-inventory.update', ['product' => $product->getKey()]) }}"
    data-column="with_storehouse_management"
    data-id="storehouse-management-{{ $product->getKey() }}"
>
    <option value="1" @selected($product->with_storehouse_management)>{{ trans('core/base::base.yes') }}</option>
    <option value="0" @selected(! $product->with_storehouse_management)>{{ trans('core/base::base.no') }}</option>
</x-core::form.select>
