<?php

namespace Botble\Base\Events;

use Illuminate\Foundation\Events\Dispatchable;

class FormComponentRegistering extends Event
{
    use Dispatchable;

    public function __construct(public object $form)
    {
    }
}
