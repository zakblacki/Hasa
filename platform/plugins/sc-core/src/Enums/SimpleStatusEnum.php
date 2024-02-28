<?php

namespace Skillcraft\Core\Enums;

use Botble\Base\Facades\Html;
use Botble\Base\Supports\Enum;
use Illuminate\Support\HtmlString;

/**
 * @method static SimpleStatusEnum ACTIVE()
 * @method static SimpleStatusEnum INACTIVE()
 */
class SimpleStatusEnum extends Enum
{
    public const ACTIVE = 'active';
    public const INACTIVE = 'inactive';

    public static $langPath = 'plugins/sc-core::enums.simple_status';

    public function toHtml(): string|HtmlString
    {
        return match ($this->value) {
            self::ACTIVE => Html::tag('span', self::ACTIVE()->label(), ['class' => 'badge bg-success text-success-fg']),
            self::INACTIVE => Html::tag('span', self::INACTIVE()->label(), ['class' => 'badge bg-warning text-warning-fg']),
            default => parent::toHtml(),
        };
    }
}
