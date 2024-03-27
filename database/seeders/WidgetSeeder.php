<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Widget\Database\Traits\HasWidgetSeeder;

class WidgetSeeder extends BaseSeeder
{
    use HasWidgetSeeder;

    public function run(): void
    {
        $data = [
            [
                'widget_id' => 'CustomMenuWidget',
                'sidebar_id' => 'footer_sidebar',
                'position' => 1,
                'data' => [
                    'id' => 'CustomMenuWidget',
                    'name' => 'Customer services',
                    'menu_id' => 'customer-services',
                ],
            ],
        ];

        $this->createWidgets($data);
    }
}
