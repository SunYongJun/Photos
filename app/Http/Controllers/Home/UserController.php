<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\ControllerBase;
use App\Http\Modal\Type;
use App\Photo;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class UserController extends ControllerBase
{
    public function index(){
        $user = \Auth::user();
        return view('home.user.index',compact('user'));
    }

    public function info(){
        return \Auth::user();
    }

    public function photos(){
        return Photo::where('user_id','=',\Auth::user()->id)->paginate(10);
    }

    public function update(Request $request){
        \Auth::user()->update($request->all());
    }

    public function photo(){
        if ($file = \Request::file('croppedImage')) {
            $path = $this->move($file,Type::find(Type::IMG));

            $user = \Auth::user();
            $user->photo = $path;
            $user->save();
            echo 'success';
        }
        echo 'error';
    }
}
