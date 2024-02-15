<div class="row">
    <div class="col-md-6">
        <x-core::form.text-input
            :label="trans('plugins/ecommerce::addresses.name')"
            name="name"
            :value="old('name', $address)"
            :placeholder="trans('plugins/ecommerce::addresses.name_placeholder')"
        />
    </div>
    <div class="col-md-6">
        <x-core::form.text-input
            :label="trans('plugins/ecommerce::addresses.phone')"
            name="phone"
            :value="old('phone', $address)"
            :placeholder="trans('plugins/ecommerce::addresses.phone_placeholder')"
        />
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <x-core::form.text-input
            :label="trans('plugins/ecommerce::addresses.email')"
            name="email"
            :value="old('email', $address)"
            :placeholder="trans('plugins/ecommerce::addresses.email_placeholder')"
        />
    </div>
    <div class="col-md-6">
        <x-core::form.text-input
            :label="trans('plugins/ecommerce::addresses.zip')"
            name="zip_code"
            :value="old('zip_code', $address)"
            :placeholder="trans('plugins/ecommerce::addresses.zip_placeholder')"
        />
    </div>
</div>
<div class="row">
    <div class="col-12">
        <x-core::form.text-input
            :label="trans('plugins/ecommerce::addresses.address')"
            name="address"
            :value="old('address', $address)"
            :placeholder="trans('plugins/ecommerce::addresses.address_placeholder')"
        />
    </div>
</div>
<div class="row">
    <div class="col-12">
        @if (EcommerceHelper::isUsingInMultipleCountries())
            <x-core::form.select
                :label="trans('plugins/ecommerce::addresses.country')"
                name="country"
                :options="EcommerceHelper::getAvailableCountries()"
                :value="old('country', $address->country)"
                data-type="country"
            />
        @else
            <input
                name="country"
                type="hidden"
                value="{{ EcommerceHelper::getFirstCountryId() }}"
            >
        @endif
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        @if (EcommerceHelper::loadCountriesStatesCitiesFromPluginLocation())
            <x-core::form.select
                :label="trans('plugins/ecommerce::addresses.state')"
                name="state"
                :options="EcommerceHelper::getAvailableStatesByCountry(old('country', $address->country))"
                :value="old('state', $address->state)"
                data-type="state"
                data-url="{{ route('ajax.states-by-country') }}"
            />
        @else
            <x-core::form.text-input
                :label="trans('plugins/ecommerce::addresses.state')"
                name="state"
                :value="old('state', $address)"
            />
        @endif
    </div>
    <div class="col-md-6">
        @if (EcommerceHelper::useCityFieldAsTextField())
            <x-core::form.text-input
                :label="trans('plugins/ecommerce::addresses.city')"
                name="city"
                :value="old('city', $address)"
            />
        @else
            <x-core::form.select
                :label="trans('plugins/ecommerce::addresses.city')"
                name="city"
                :options="EcommerceHelper::getAvailableCitiesByState(old('state', $address->state))"
                :value="old('city', $address->city)"
                data-type="city"
                data-url="{{ route('ajax.cities-by-state') }}"
            />
        @endif
    </div>
</div>

<x-core::form.checkbox
    :label="__('Use this address as default.')"
    name="send_mail"
    :value="1"
    :inline="true"
/>

<div class="form-group mb-3">
    <button
        class="{{ $buttonClass ?? 'btn btn-primary' }}"
        type="submit"
    >{{ __('Update') }}</button>
</div>
