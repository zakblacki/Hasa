@php $satimStatus = setting('payment_satim_status'); @endphp
<table class="table payment-method-item">
    <tbody>
        <tr class="border-pay-row">
            <td class="border-pay-col"><i class="fa fa-theme-payments"></i></td>
            <td style="width: 20%;">
                <img
                    class="filter-black"
                    src="{{ url('vendor/core/plugins/satim/images/satim.png') }}"
                    alt="satim"
                >
            </td>
            <td class="border-right">
                <ul>
                    <li>
                        <a
                            href="https://www.cibweb.dz/fr/"
                            target="_blank"
                        >Satim</a>
                        <p>{{ __('Customer can buy product and pay directly using Visa, Credit card via Satim') }}</p>
                    </li>
                </ul>
            </td>
        </tr>
        <tr class="bg-white">
            <td colspan="3">
                <div
                    class="float-start"
                    style="margin-top: 5px;"
                >
                    <div class="payment-name-label-group @if ($satimStatus == 0) hidden @endif">
                        <span class="payment-note v-a-t">{{ trans('plugins/payment::payment.use') }}:</span>
                        <label
                            class="ws-nm inline-display method-name-label">{{ __('Satim') }}</label>
                    </div>
                </div>
                <div class="float-end">
                    <a
                        class="btn btn-secondary toggle-payment-item edit-payment-item-btn-trigger @if ($satimStatus == 0) hidden @endif">{{ trans('plugins/payment::payment.edit') }}</a>
                    <a
                        class="btn btn-secondary toggle-payment-item save-payment-item-btn-trigger @if ($satimStatus == 1) hidden @endif">{{ trans('plugins/payment::payment.settings') }}</a>
                </div>
            </td>
        </tr>
        <tr class="payment-content-item hidden">
            <td
                class="border-left"
                colspan="3"
            >
                {!! Form::open() !!}
                {!! Form::hidden('type', SATIM_PAYMENT_METHOD_NAME, ['class' => 'payment_type']) !!}
                <div class="row">
                    <div class="col-sm-6">
                        <ul>
                            <li>
                                <label>{{ trans('plugins/payment::payment.configuration_instruction', ['name' => 'Satim']) }}</label>
                            </li>
                            <li class="payment-note">
                                <p>{{ trans('plugins/payment::payment.configuration_requirement', ['name' => 'Satim']) }}:
                                </p>
                                <ul
                                    class="m-md-l"
                                    style="list-style-type:decimal"
                                >
                                    <li style="list-style-type:decimal">
                                        <a
                                            href="https://www.cibweb.dz/fr/"
                                            target="_blank"
                                        >
                                            {{ trans('plugins/payment::payment.service_registration', ['name' => 'Satim']) }}
                                        </a>
                                    </li>
                                    <li style="list-style-type:decimal">
                                        <p>{{ __('After registration at :name, you will have Username, Password', ['name' => 'Satim']) }}
                                        </p>
                                    </li>
                                    <li style="list-style-type:decimal">
                                        <p>{{ __('Enter Satim Username and Password on right side.') }}
                                        </p>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-6">
                        <div class="well bg-white">
                            <x-core-setting::text-input
                                name="payment_satim_name"
                                data-counter="400"
                                :label="trans('plugins/payment::payment.method_name')"
                                :value="setting(
                                    'payment_satim_name',
                                    trans('plugins/payment::payment.pay_online_via', ['name' => 'Satim']),
                                )"
                            />

                            <x-core-setting::form-group>
                                <label
                                    class="text-title-field"
                                    for="payment_satim_description"
                                >{{ trans('core/base::forms.description') }}</label>
                                <textarea
                                    class="next-input"
                                    id="payment_satim_description"
                                    name="payment_satim_description"
                                >{{ get_payment_setting('description', 'satim', __('Payment with :paymentType', ['paymentType' => 'Satim'])) }}</textarea>
                            </x-core-setting::form-group>

                            <p class="payment-note">
                                {{ trans('plugins/payment::payment.please_provide_information') }} <a
                                    href="https://www.cibweb.dz/fr/"
                                    target="_blank"
                                >Satim</a>:
                            </p>

                            <x-core-setting::text-input
                                name="payment_satim_client_id"
                                data-counter="400"
                                :label="__('Username')"
                                :value="BaseHelper::hasDemoModeEnabled()
                                    ? ''
                                    : setting('payment_satim_client_id')"
                                placeholder="Satim User Name"
                            />

                            <x-core-setting::text-input
                                name="payment_satim_secret"
                                type="password"
                                :label="__('Password')"
                                :value="BaseHelper::hasDemoModeEnabled()
                                    ? ''
                                    : setting('payment_satim_secret')"
                                placeholder="Password"
                            />

                            <x-core-setting::text-input
                                name="payment_satim_force_terminal_id"
                                data-counter="400"
                                :label="__('Force Terminal ID')"
                                :value="BaseHelper::hasDemoModeEnabled()
                                    ? ''
                                    : setting('payment_satim_force_terminal_id')"
                                placeholder="Force Terminal ID"
                            />

                            <x-core-setting::select
                                :name="'payment_' . SATIM_PAYMENT_METHOD_NAME . '_payment_type'"
                                :label="__('Type')"
                                :options="[
                                    'sandbox' => 'Sandbox',
                                    'live' => 'Live',
                                ]"
                                :value="get_payment_setting(
                                    'payment_type',
                                    SATIM_PAYMENT_METHOD_NAME,
                                    'mode',
                                )"
                            />

                            {!! apply_filters(PAYMENT_METHOD_SETTINGS_CONTENT, null, 'satim') !!}
                        </div>
                    </div>
                </div>
                <div class="col-12 bg-white text-end">
                    <button
                        class="btn btn-warning disable-payment-item @if ($satimStatus == 0) hidden @endif"
                        type="button"
                    >{{ trans('plugins/payment::payment.deactivate') }}</button>
                    <button
                        class="btn btn-info save-payment-item btn-text-trigger-save @if ($satimStatus == 1) hidden @endif"
                        type="button"
                    >{{ trans('plugins/payment::payment.activate') }}</button>
                    <button
                        class="btn btn-info save-payment-item btn-text-trigger-update @if ($satimStatus == 0) hidden @endif"
                        type="button"
                    >{{ trans('plugins/payment::payment.update') }}</button>
                </div>
                {!! Form::close() !!}
            </td>
        </tr>
    </tbody>
</table>
