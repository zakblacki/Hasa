<?php

namespace Botble\Ecommerce\Tables;

use Botble\Table\Columns\FormattedColumn;
use Botble\Table\Columns\IdColumn;
use Illuminate\Database\Eloquent\Builder;

class ProductInventoryTable extends ProductBulkEditableTable
{
    public function setup(): void
    {
        parent::setup();

        $this
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
                FormattedColumn::make('with_storehouse_management')
                    ->title(trans('plugins/ecommerce::product-inventory.storehouse_management'))
                    ->alignCenter()
                    ->renderUsing(function (FormattedColumn $column) {
                        return view('plugins/ecommerce::product-inventory.columns.storehouse_management', [
                            'product' => $column->getItem(),
                            'type' => 'storehouse_management',
                        ]);
                    })
                    ->nowrap()
                    ->orderable(false),
                FormattedColumn::make('quantity')
                    ->title(trans('plugins/ecommerce::products.form.quantity'))
                    ->alignCenter()
                    ->renderUsing(function (FormattedColumn $column) {
                        return view('plugins/ecommerce::product-inventory.columns.quantity', [
                            'product' => $column->getItem(),
                        ]);
                    })
                    ->nowrap()
                    ->orderable(false),
            ])
            ->queryUsing(function (Builder $query) {
                $this->applyQueryWithVariations($query, function (Builder $query) {
                    $query->addSelect([
                        'ec_products.stock_status',
                        'ec_products.quantity',
                        'ec_products.with_storehouse_management',
                    ]);
                });
            });
    }
}
