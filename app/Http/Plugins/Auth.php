<?php
namespace App\Http\Plugins;
/**
 *权限控制
 */
class Auth{
    public  $resource = [];
    public  function isAllowd($auth,$route){
        return isset($this->resource[$auth]) ? in_array($route,$this->resource[$auth]) : false;
    }

    public  function  addResource($auth,$route){
        $this->resource[$auth][]=$route;
    }

}