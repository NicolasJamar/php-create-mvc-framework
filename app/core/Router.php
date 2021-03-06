<?php  

namespace app\core;

/**
 * @author Nicolas Jamar <nicolas.jamar@gmail.com>
 * @package app\core
 */
class Router 
{
    public Request $request;
    protected array $routes = [];

    /**
     * Router constructor.
     * @param Request $request
     */
    public function __construct(Request $request)
    {
        $this->request = $request;
    }

    public function get($path, $callback)
	{
        $this->routes['get'][$path] = $callback;
	}

    public function resolve()
    {
        $path = $this->request->getPath();
        $method = $this->request->getMethod();
        # ?? == if not set, return false
        $callback = $this->routes[$method][$path] ?? false;
        if($callback === false) {
            return 'Not found';
        }
        if (is_string($callback)) {
            return $this->renderView($callback);
        }
        return call_user_func($callback);
    }

    public function renderView($view)
    {
        include_once "../views/$view.php";
    }
}