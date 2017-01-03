<?php

namespace App\Http\Middleware;

use App\Http\Modal\Type;
use Closure;

class TypeMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $types = Type::all();
        view()->share('types',$types);
        return $next($request);
    }
}
