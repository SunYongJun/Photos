<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Request;

class Photo extends Model
{
    const UNAPPROVED = -1;
    const VERIFIED = 1;
    const NO_CHECKED = 0;
    
    protected $fillable = ['user_id','name','path','resize_path','keywords','description','status'];

    public function user(){
        return $this->belongsTo('App\User');
    }
    public function scopeFilter($query){
        if(Request::get('keyword')){
            $query->whereRaw('name like ? or keywords like ?',[
                '%'.Request::get('keyword').'%',
                '%'.Request::get('keyword').'%'
            ]);
        }
        if(null !== Request::get('status')){
            $query->where('status','=',Request::get('status'));
        }
        if(Request::get('uid')){
            $query->where('user_id','=',Request::get('uid'));
        }

        return $query;
    }
}
