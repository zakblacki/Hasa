@extends(EcommerceHelper::viewPath('customers.layouts.account-settings'))

@section('account-content')
    <h2 class="customer-page-title mb-4">{{ __('Account information') }}</h2>

    {!! Form::open(['route' => 'customer.edit-account']) !!}
        <div class="form-group mb-3">
            <label
                class="form-label"
                for="name"
            >{{ __('Full Name') }}: </label>
            <input
                class="form-control"
                id="name"
                name="name"
                type="text"
                value="{{ auth('customer')->user()->name }}"
            >
            {!! Form::error('name', $errors) !!}
        </div>

        <div class="form-group mb-3 @if ($errors->has('dob')) has-error @endif">
            <label
                class="form-label"
                for="date_of_birth"
            >{{ __('Date of birth') }}: </label>
            <input
                class="form-control"
                id="date_of_birth"
                name="dob"
                type="text"
                value="{{ auth('customer')->user()->dob ? auth('customer')->user()->dob->toDateString() : null }}"
            >
            {!! Form::error('dob', $errors) !!}
        </div>
        <div class="form-group mb-3 @if ($errors->has('email')) has-error @endif">
            <label
                class="form-label"
                for="email"
            >{{ __('Email') }}: </label>
            <input
                class="form-control"
                id="email"
                name="email"
                type="text"
                value="{{ auth('customer')->user()->email }}"
                disabled="disabled"
            >
            {!! Form::error('email', $errors) !!}
        </div>

        <div class="form-group mb-3 @if ($errors->has('phone')) has-error @endif">
            <label
                class="form-label"
                for="phone"
            >{{ __('Phone') }}: </label>
            <input
                class="form-control"
                id="phone"
                name="phone"
                type="text"
                value="{{ auth('customer')->user()->phone }}"
                placeholder="{{ __('Phone') }}"
            >
            {!! Form::error('phone', $errors) !!}
        </div>

        <div class="form-group">
            <button
                class="{{ $buttonClass ?? 'btn btn-primary' }}"
                type="submit"
            >{{ __('Update') }}</button>
        </div>
    {!! Form::close() !!}

    <div class="delete-account-section">
        <h2 class="customer-page-title text-danger">{{ __('Delete account') }}</h2>

        <p>
            {{ __('This action will permanently delete your account and all associated data and irreversible. Please be sure before proceeding.') }}
        </p>

        <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#delete-account-modal" data-toggle="modal" data-target="#delete-account-modal">{{ __('Delete your account') }}</button>

        <div class="modal fade" id="delete-account-modal" tabindex="-1" aria-labelledby="deleteAccountModal" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title fs-6" id="deleteAccountModal">
                            {{ __('Are you sure you want to do this?') }}
                        </h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" data-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p class="text-muted">
                            {{ __('We will send you an email to confirm your account deletion. Once you confirm, your account will be deleted permanently.') }}
                        </p>
                        <x-core::form :url="route('customer.delete-account.store')" method="post">
                            <div class="mb-3">
                                <label for="password" class="form-label">{{ __('Confirm your password') }}</label>
                                <input type="password" id="password" name="password" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="reason" class="form-label">{{ __('Reason (optional)') }}</label>
                                <textarea id="reason" name="reason" class="form-control" rows="3"></textarea>
                            </div>
                            <button type="submit" class="w-100 btn btn-danger">{{ __('Request delete account') }}</button>
                        </x-core::form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
