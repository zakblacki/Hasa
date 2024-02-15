<?php

namespace Botble\Ecommerce\Tables;

use Botble\Base\Facades\Assets;
use Botble\Base\Facades\Html;
use Botble\Ecommerce\Facades\EcommerceHelper;
use Botble\Ecommerce\Models\Tax;
use Botble\Ecommerce\Models\TaxRule;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\Actions\DeleteAction;
use Botble\Table\Actions\EditAction;
use Botble\Table\BulkActions\DeleteBulkAction;
use Botble\Table\Columns\Column;
use Botble\Table\Columns\CreatedAtColumn;
use Botble\Table\Columns\FormattedColumn;
use Botble\Table\Columns\IdColumn;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Route;

class TaxRuleTable extends TableAbstract
{
    protected Tax $tax;

    public function setup(): void
    {
        Assets::addScriptsDirectly('vendor/core/plugins/ecommerce/js/tax.js');

        add_filter(
            'core_layout_after_content',
            fn ($html) => $html . view('plugins/ecommerce::taxes.rules.form-modal')->render()
        );

        /** @var Tax $tax  */
        $tax = Route::current()->parameter('tax', new Tax());

        $this
            ->model(TaxRule::class)
            ->setOption('id', 'ecommerce-tax-rule-table')
            ->setTax($tax)
            ->addActions([
                EditAction::make()->route('tax.rule.edit')->attributes(['class' => 'btn btn-sm btn-icon btn-primary btn-edit-item']),
                DeleteAction::make()->route('tax.rule.destroy'),
            ]);
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('country', fn (TaxRule $item) => $item->country_name)
            ->editColumn('state', fn (TaxRule $item) => $item->state_name)
            ->editColumn('city', fn (TaxRule $item) => $item->city_name);

        return $this->toJson($data);
    }

    public function query(): Relation|Builder|QueryBuilder
    {
        $with = [];
        if (EcommerceHelper::loadCountriesStatesCitiesFromPluginLocation()) {
            $with = ['locationCountry', 'locationState', 'locationCity'];
        }

        $query = $this
            ->getModel()
            ->query()
            ->where('tax_id', $this->tax->id)
            ->with($with);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        $columns = [
            IdColumn::make(),
            FormattedColumn::make('country')
                ->title(trans('plugins/ecommerce::tax.country'))
                ->withEmptyState(),
            FormattedColumn::make('state')
                ->title(trans('plugins/ecommerce::tax.state'))
                ->withEmptyState(),
            FormattedColumn::make('city')
                ->title(trans('plugins/ecommerce::tax.city'))
                ->withEmptyState(),
            FormattedColumn::make('zip_code')
                ->title(trans('plugins/ecommerce::tax.zip_code'))
                ->withEmptyState(),
            CreatedAtColumn::make(),
        ];

        if (! EcommerceHelper::isZipCodeEnabled()) {
            $columns = Arr::where($columns, fn (Column $column) => $column->get('name') != 'zip_code');
        }

        return $columns;
    }

    public function getButtons(): array
    {
        $data = parent::getButtons();
        $data[] = [
            'className' => 'create-tax-rule-item btn-primary',
            'text' => Html::tag('span', view('core/table::partials.create')->render(), [
                'data-href' => route('tax.rule.create', ['tax_id' => $this->tax->getKey()]),
                'data-action' => 'create',
            ])->toHtml(),
        ];

        return $data;
    }

    public function bulkActions(): array
    {
        return [
            DeleteBulkAction::make()->permission('tax.rule.destroy'),
        ];
    }

    public function setTax(Tax $tax): self
    {
        return tap($this, fn () => $this->tax = $tax);
    }
}
