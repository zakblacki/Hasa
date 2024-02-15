<?php

use Botble\Base\Facades\AdminHelper;
use Botble\Base\Http\Middleware\RequiresJsonRequestMiddleware;
use Botble\Ecommerce\Http\Controllers\Fronts\QuickViewController;
use Botble\Ecommerce\Models\Product;
use Botble\Slug\Facades\SlugHelper;
use Botble\Theme\Events\ThemeRoutingBeforeEvent;
use Botble\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;

AdminHelper::registerRoutes(function () {
    Route::group(['namespace' => 'Botble\Ecommerce\Http\Controllers'], function () {
        Route::group(['prefix' => 'ecommerce'], function () {
            Route::post('update-currencies-from-exchange-api', [
                'as' => 'ecommerce.setting.update-currencies-from-exchange-api',
                'uses' => 'EcommerceController@updateCurrenciesFromExchangeApi',
                'permission' => 'ecommerce.settings',
            ]);

            Route::post('clear-cache-currency-rates', [
                'as' => 'ecommerce.setting.clear-cache-currency-rates',
                'uses' => 'EcommerceController@clearCacheCurrencyRates',
                'permission' => 'ecommerce.settings',
            ]);

            Route::get('ajax/countries', [
                'as' => 'ajax.countries.list',
                'uses' => 'EcommerceController@ajaxGetCountries',
                'permission' => false,
            ]);

            Route::get('store-locators/form/{id?}', [
                'as' => 'ecommerce.store-locators.form',
                'uses' => 'StoreLocatorController@edit',
                'permission' => 'ecommerce.settings',
            ]);

            Route::post('store-locators/edit/{locator}', [
                'as' => 'ecommerce.store-locators.edit.post',
                'uses' => 'StoreLocatorController@update',
                'permission' => 'ecommerce.settings',
            ])->wherePrimaryKey();

            Route::post('store-locators/create', [
                'as' => 'ecommerce.store-locators.create',
                'uses' => 'StoreLocatorController@store',
                'permission' => 'ecommerce.settings',
            ]);

            Route::post('store-locators/delete/{locator}', [
                'as' => 'ecommerce.store-locators.destroy',
                'uses' => 'StoreLocatorController@destroy',
                'permission' => 'ecommerce.settings',
            ])->wherePrimaryKey();

            Route::post('store-locators/update-primary-store', [
                'as' => 'ecommerce.store-locators.update-primary-store',
                'uses' => 'ChangePrimaryStoreController@__invoke',
                'permission' => 'ecommerce.settings',
            ]);

            Route::group(['prefix' => 'product-categories', 'as' => 'product-categories.'], function () {
                Route::resource('', 'ProductCategoryController')
                    ->parameters(['' => 'product_category']);

                Route::put('update-tree', [
                    'as' => 'update-tree',
                    'uses' => 'ProductCategoryController@updateTree',
                    'permission' => 'product-categories.edit',
                ]);

                Route::get('search', [
                    'as' => 'search',
                    'uses' => 'ProductCategoryController@getSearch',
                    'permission' => 'product-categories.index',
                ]);

                Route::get('get-list-product-categories-for-select', [
                    'as' => 'get-list-product-categories-for-select',
                    'uses' => 'ProductCategoryController@getListForSelect',
                    'permission' => 'product-categories.index',
                ]);
            });

            Route::group(['prefix' => 'product-tags', 'as' => 'product-tag.'], function () {
                Route::resource('', 'ProductTagController')
                    ->parameters(['' => 'product-tag']);

                Route::get('all', [
                    'as' => 'all',
                    'uses' => 'ProductTagController@getAllTags',
                    'permission' => 'product-tag.index',
                ]);
            });

            Route::group(['prefix' => 'options', 'as' => 'global-option.'], function () {
                Route::resource('', 'ProductOptionController')->parameters(['' => 'option']);

                Route::get('ajax', [
                    'as' => 'ajaxInfo',
                    'uses' => 'ProductOptionController@ajaxInfo',
                    'permission' => 'products.edit',
                ]);
            });

            Route::group(['prefix' => 'brands', 'as' => 'brands.'], function () {
                Route::resource('', 'BrandController')
                    ->parameters(['' => 'brand']);

                Route::get('search', [
                    'as' => 'search',
                    'uses' => 'BrandController@getSearch',
                    'permission' => 'brands.index',
                ]);
            });

            Route::group(['prefix' => 'product-collections', 'as' => 'product-collections.'], function () {
                Route::resource('', 'ProductCollectionController')
                    ->parameters(['' => 'product_collection']);

                Route::get('get-list-product-collections-for-select', [
                    'as' => 'get-list-product-collections-for-select',
                    'uses' => 'ProductCollectionController@getListForSelect',
                    'permission' => 'product-collections.index',
                ]);

                Route::get('get-product-collection/{productCollection?}', [
                    'as' => 'get-product-collection',
                    'uses' => 'ProductCollectionController@getProductCollection',
                    'permission' => 'product-collections.edit',
                ])->wherePrimaryKey();
            });

            Route::group(['prefix' => 'product-attribute-sets', 'as' => 'product-attribute-sets.'], function () {
                Route::resource('', 'ProductAttributeSetsController')
                    ->parameters(['' => 'product_attribute_set']);
            });

            Route::group(['prefix' => 'reports'], function () {
                Route::get('', [
                    'as' => 'ecommerce.report.index',
                    'uses' => 'ReportController@getIndex',
                ]);

                Route::post('top-selling-products', [
                    'as' => 'ecommerce.report.top-selling-products',
                    'uses' => 'ReportController@getTopSellingProducts',
                    'permission' => 'ecommerce.report.index',
                ]);

                Route::post('recent-orders', [
                    'as' => 'ecommerce.report.recent-orders',
                    'uses' => 'ReportController@getRecentOrders',
                    'permission' => 'ecommerce.report.index',
                ]);

                Route::post('trending-products', [
                    'as' => 'ecommerce.report.trending-products',
                    'uses' => 'ReportController@getTrendingProducts',
                    'permission' => 'ecommerce.report.index',
                ]);

                Route::get('dashboard-general-report', [
                    'as' => 'ecommerce.report.dashboard-widget.general',
                    'uses' => 'ReportController@getDashboardWidgetGeneral',
                    'permission' => 'ecommerce.report.index',
                ]);
            });

            Route::group(['prefix' => 'flash-sales', 'as' => 'flash-sale.'], function () {
                Route::resource('', 'FlashSaleController')->parameters(['' => 'flash-sale']);
            });

            Route::group(['prefix' => 'product-labels', 'as' => 'product-label.'], function () {
                Route::resource('', 'ProductLabelController')->parameters(['' => 'product-label']);
            });

            Route::group(['prefix' => 'import', 'as' => 'ecommerce.import.'], function () {
                Route::group(['prefix' => 'products', 'as' => 'products.'], function () {
                    Route::get('/', [
                        'as' => 'index',
                        'uses' => 'BulkImportController@index',
                    ]);

                    Route::post('/', [
                        'as' => 'index.post',
                        'uses' => 'BulkImportController@postImport',
                        'permission' => 'ecommerce.import.products.index',
                    ]);

                    Route::post('/download-template', [
                        'as' => 'download-template',
                        'uses' => 'BulkImportController@downloadTemplate',
                        'permission' => 'ecommerce.import.products.index',
                    ]);
                });
            });

            Route::group(['prefix' => 'export', 'as' => 'ecommerce.export.'], function () {
                Route::group(['prefix' => 'products', 'as' => 'products.'], function () {
                    Route::get('/', [
                        'as' => 'index',
                        'uses' => 'ExportController@products',
                    ]);

                    Route::post('/', [
                        'as' => 'index.post',
                        'uses' => 'ExportController@exportProducts',
                        'permission' => 'ecommerce.export.products.index',
                    ]);
                });
            });
        });
    });
});

Theme::registerRoutes(function () {
    app('events')->listen(ThemeRoutingBeforeEvent::class, function () {
        Route::group(['namespace' => 'Botble\Ecommerce\Http\Controllers\Fronts'], function () {
            Route::get(
                (theme_option('ecommerce_product_listing_page_slug') ?: (SlugHelper::getPrefix(
                    Product::class,
                    'products'
                ) ?: 'products')),
                [
                    'uses' => 'PublicProductController@getProducts',
                    'as' => 'public.products',
                ]
            );

            Route::get('currency/switch/{code?}', [
                'as' => 'public.change-currency',
                'uses' => 'PublicEcommerceController@changeCurrency',
            ]);

            Route::get('product-variation/{id}', [
                'as' => 'public.web.get-variation-by-attributes',
                'uses' => 'PublicProductController@getProductVariation',
            ])->wherePrimaryKey();

            Route::get('orders/tracking', [
                'as' => 'public.orders.tracking',
                'uses' => 'PublicProductController@getOrderTracking',
            ])->wherePrimaryKey();

            Route::get('ajax/quick-view/{id?}', [QuickViewController::class, 'show'])
                ->middleware(RequiresJsonRequestMiddleware::class)
                ->name('public.ajax.quick-view')
                ->wherePrimaryKey();
        });
    });
});
