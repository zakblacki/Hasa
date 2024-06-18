<?php

namespace Botble\Ecommerce\Tables;

use Botble\Ecommerce\Models\Product;
use Botble\Table\Abstracts\TableAbstract;
use Closure;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Query\JoinClause;
use Illuminate\Http\JsonResponse;

abstract class ProductBulkEditableTable extends TableAbstract
{
    protected int $pageLength = 100;

    public function setup(): void
    {
        $this
            ->model(Product::class)
            ->addActions([]);
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->filter(function ($query) {
                $keyword = request()->input('search.value');

                if ($keyword) {
                    $keyword = '%' . $keyword . '%';

                    $query
                        ->where('ec_products.name', 'LIKE', $keyword)
                        ->orWhere('ec_products.sku', 'LIKE', $keyword);

                    return $query;
                }

                return $query;
            });

        return $this->toJson($data);
    }

    protected function hasOperations(): bool
    {
        return false;
    }

    public function applyQueryWithVariations(Builder $query, Closure $callback = null): Builder
    {
        $query
            ->select([
                'ec_products.id',
                'ec_products.name',
                'ec_products.sku',
                'ec_products.is_variation',
                'ec_product_variations.configurable_product_id as parent_product_id',
            ])
            ->leftJoin('ec_product_variations', function (JoinClause $join) {
                $join
                    ->on('ec_products.id', '=', 'ec_product_variations.product_id')
                    ->where('ec_products.is_variation', 1);
            })
            ->with(['variationProductAttributes'])
            ->where(function (Builder $query) {
                $query
                    ->where(function (Builder $query) {
                        $query
                            ->where('ec_products.is_variation', 0)
                            ->whereDoesntHave('variations');
                    })
                    ->orWhere('ec_products.is_variation', 1);
            })
            ->latest('parent_product_id');

        if ($callback) {
            $callback($query);
        }

        return $query;
    }
}
