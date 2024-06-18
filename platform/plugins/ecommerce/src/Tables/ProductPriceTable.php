<?php

namespace Botble\Ecommerce\Tables;

use Botble\Table\Columns\FormattedColumn;
use Botble\Table\Columns\IdColumn;
use Illuminate\Database\Eloquent\Builder;

class ProductPriceTable extends ProductBulkEditableTable
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setView('plugins/ecommerce::product-prices.index')
            ->addColumns([
                IdColumn::make()
                    ->orderable(false),
                FormattedColumn::make('name')
                    ->title(trans('plugins/ecommerce::products.name'))
                    ->renderUsing(function (FormattedColumn $column) {
                        return view('plugins/ecommerce::product-prices.columns.name', [
                            'product' => $column->getItem(),
                        ]);
                    })
                    ->nowrap()
                    ->orderable(false),
                FormattedColumn::make('cost_per_item')
                    ->title(trans('plugins/ecommerce::products.form.cost_per_item'))
                    ->renderUsing(function (FormattedColumn $column) {
                        return view('plugins/ecommerce::product-prices.columns.price', [
                            'product' => $column->getItem(),
                            'type' => 'cost_per_item',
                        ]);
                    })
                    ->nowrap()
                    ->orderable(false),
                FormattedColumn::make('price')
                    ->title(trans('plugins/ecommerce::products.form.price'))
                    ->renderUsing(function (FormattedColumn $column) {
                        return view('plugins/ecommerce::product-prices.columns.price', [
                            'product' => $column->getItem(),
                            'type' => 'price',
                        ]);
                    })
                    ->nowrap()
                    ->orderable(false),
                FormattedColumn::make('sale_price')
                    ->title(trans('plugins/ecommerce::products.form.price_sale'))
                    ->renderUsing(function (FormattedColumn $column) {
                        return view('plugins/ecommerce::product-prices.columns.price', [
                            'product' => $column->getItem(),
                            'type' => 'sale_price',
                        ]);
                    })
                    ->nowrap()
                    ->orderable(false),
            ])
            ->queryUsing(function (Builder $query) {
                $this->applyQueryWithVariations($query, function (Builder $query) {
                    $query->addSelect([
                        'ec_products.cost_per_item',
                        'ec_products.price',
                        'ec_products.sale_price',
                        'ec_products.sale_type',
                    ]);
                });
            });
    }
}
