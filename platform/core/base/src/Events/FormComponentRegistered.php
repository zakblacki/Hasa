<?php

namespace Botble\Base\Events;

use Illuminate\Foundation\Events\Dispatchable;

class FormComponentRegistered extends Event
{
    use Dispatchable;

    public function __construct(public object $form)
    {
    }
}
