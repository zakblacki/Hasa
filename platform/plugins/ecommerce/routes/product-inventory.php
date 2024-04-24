<?php

use Botble\Base\Facades\AdminHelper;
use Illuminate\Support\Facades\Route;

AdminHelper::registerRoutes(function () {
    Route::group(
        [
            'namespace' => 'Botble\Ecommerce\Http\Controllers',
            'prefix' => 'ecommerce',
            'as' => 'ecommerce.',
        ],
        function () {
            Route::group([
                'prefix' => 'product-inventory',
                'as' => 'product-inventory.',
            ], function () {
                Route::match(['GET', 'POST'], '', [
                    'uses' => 'ProductInventoryController@index',
                    'as' => 'index',
                    'permission' => 'ecommerce.product-inventory.index',
                ]);

                Route::put('{product}', [
                    'uses' => 'ProductInventoryController@update',
                    'as' => 'update',
                    'permission' => 'ecommerce.product-inventory.edit',
                ])->wherePrimaryKey();
            });
        }
    );
});
