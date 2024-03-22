<?php

namespace Botble\Satim;

use Botble\PluginManagement\Abstracts\PluginOperationAbstract;
use Botble\Setting\Facades\Setting;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Setting::delete([
            'payment_satim_mode',
            'payment_satim_name',
            'payment_satim_description',
            'payment_satim_client_id',
            'payment_satim_secret',
            'payment_satim_status',
            'payment_satim_force_terminal_id',
        ]);
    }
}
