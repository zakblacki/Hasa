@extends(EcommerceHelper::viewPath('customers.master'))

@section('content')
    @php
        Theme::set('pageName', __('Return Product(s)'));
    @endphp

    <h2 class="customer-page-title mb-4">{{ __('Return Product(s)') }}</h2>

    @include(EcommerceHelper::viewPath('includes.order-return-detail'))
@endsection
