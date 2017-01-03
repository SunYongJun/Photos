<?php

namespace App\Http\Middleware;

use App\Http\Plugins\Memory;
use Closure;
use Illuminate\Support\Facades\Route;

class Acl
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
        if(Memory::isAllowed(\Auth::user()->auth_group_id,Route::currentRouteName())){
            return $next($request);
        }else{
            return redirect()->back()->withErrors('权限拒绝!');
        }
    }
}
