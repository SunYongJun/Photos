<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\Request;

class User extends Authenticatable
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','photo'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function photos(){
        return $this->hasMany('App\Photo');
    }

    public function max(){
        return $this->hasMany('App\Max');
    }

    public function maya(){
        return $this->hasMany('App\Maya');
    }

    public function scopeKeyword($query){
        if(Request::get('keyword')){
            return $query->whereRaw('name LIKE ? OR email like ?',[
                '%'.Request::get('keyword').'%',
                '%'.Request::get('keyword').'%'
            ]);
        }else{
            return $query;
        }
    }
}
