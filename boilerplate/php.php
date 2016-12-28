<?php

namespace spec;

use %srcName%;
use PhpSpec\ObjectBehavior;
use Prophecy\Argument;

class %specName% extends ObjectBehavior
{
    function it_is_initializable()
    {
        $this->shouldHaveType(%srcName%::class);
    }
}
