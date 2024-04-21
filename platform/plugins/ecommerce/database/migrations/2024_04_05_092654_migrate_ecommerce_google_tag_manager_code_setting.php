<?php

use Illuminate\Database\Migrations\Migration;

return new class extends Migration
{
    public function up(): void
    {
        $googleTagManagerCode = get_ecommerce_setting('google_tag_manager_code');

        if ($googleTagManagerCode) {
            setting('google_tag_manager_code', $googleTagManagerCode);
            setting('google_tag_manager_type', 'code');
            setting()->save();
        }
    }
};
