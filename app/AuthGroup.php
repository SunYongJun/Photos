<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AuthGroup extends Model
{
    protected $fillable = ['name','rules'];
    public function getRules(){
        return AuthRules::whereIn('id',explode(',',$this->rules))->get();
    }

    public function getRulesIds(){
        return explode(',',$this->rules);
    }
}
