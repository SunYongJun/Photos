<?php
namespace App\Http\Plugins;
/**
 * 权限访问
*/

use App\AuthGroup;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Storage;

class Memory{
    public static function isAllowed($auth,$route){
        $file = Config::get('application.acl');
        if(!Storage::exists($file)){
            $acl = new Auth();
            foreach (AuthGroup::all() as $group){
                foreach($group->getRules() as $rule){
                    $acl->addResource($group->id,$rule->route);
                }
            }
            Storage::put($file,serialize($acl));
        }else{
            $acl = unserialize(Storage::get($file));
        }
        return $acl->isAllowd($auth,$route);
    }
}