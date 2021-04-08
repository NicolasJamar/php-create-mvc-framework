<?php

namespace app\core;

/**
 * @author Nicolas Jamar <nicolas.jamar@gmail.com>
 * @package app\core
 */
class Application 
{
	public Router $router;

	public function __construct()
	{
		$this->router = new Router();
	}

	public function run()
    {
        $this->router->resolve();
    }
}