@extends(EcommerceHelper::viewPath('customers.master'))

@section('content')
    @php
        $customer = auth('customer')->user();
        EcommerceHelper::registerThemeAssets();
    @endphp

    <div class="bb-customer-profile-wrapper">
        <div class="bb-customer-profile">
            <div class="bb-customer-profile-avatar">
                {{ RvMedia::image($customer->avatar_url, $customer->name, attributes: ['class' => 'bb-customer-profile-avatar-img', 'data-bb-value' => 'customer-avatar']) }}
                <div class="bb-customer-profile-avatar-overlay">
                    <input type="file" id="customer-avatar" name="avatar" data-bb-toggle="change-customer-avatar" data-url="{{ route('customer.avatar') }}" />
                    <label for="customer-avatar"><x-core::icon name="ti ti-camera" :wrapper="false" /></label>
                </div>
            </div>

            <div class="bb-customer-profile-info">
                <h4>{!! BaseHelper::clean(
                    __('Hello <strong>:name</strong>,', [
                        'name' => $customer->name,
                    ]),
                ) !!}</h4>
                <p>{!! BaseHelper::clean(
                    __(
                        'From your account dashboard you can view your <a class="text-primary" href=":order">recent orders</a>, manage your <a class="text-primary" href=":addresses">shipping and billing addresses</a>, and <a class="text-primary" href=":edit_account">edit your password and account details</a>.',
                        [
                            'order' => route('customer.orders'),
                            'addresses' => route('customer.address'),
                            'edit_account' => route('customer.edit-account'),
                        ],
                    ),
                ) !!}</p>
            </div>
        </div>

        @if (! $customer->orders()->exists())
            <div
                role="alert"
                class="alert alert-info d-flex align-items-center justify-content-between mt-3 mb-0"
            >
                <div class="d-flex align-items-center gap-2">
                    <x-core::icon name="ti ti-circle-check" />
                    {{ __('No orders has been made yet.') }}
                </div>

                <a href="{{ route('public.products') }}">{{ __('Browse products') }}</a>
            </div>
        @endif
    </div>
@endsection
