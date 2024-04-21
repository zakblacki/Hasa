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
                'prefix' => 'product-prices',
                'as' => 'product-prices.',
            ], function () {
                Route::match(['GET', 'POST'], '', [
                    'uses' => 'ProductPriceController@index',
                    'as' => 'index',
                    'permission' => 'ecommerce.product-prices.index',
                ]);

                Route::put('{product}', [
                    'uses' => 'ProductPriceController@update',
                    'as' => 'update',
                    'permission' => 'ecommerce.product-prices.edit',
                ])->wherePrimaryKey();
            });
        }
    );
});
