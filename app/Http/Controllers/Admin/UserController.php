<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\ControllerBase;
use App\Http\Modal\Type;
use App\User;
use Illuminate\Http\Request;
use Auth;
use App\Http\Requests;

class UserController extends ControllerBase
{
    public function index(){
        return User::keyword()->paginate(10);
    }

    public function store(Request $request){
        User::create($request->all());
    }

    public function show($id){
        return User::find($id);
    }

    public function update($id,Request $request){
        if(User::find($id)->update($request->all())){
            return 'true';
        }else{
            return 'false';
        }
    }

    public function all(){
        return User::all();
    }

    public function info(){
        return \Auth::user();
    }

    public function pwdupdate(Request $request){
        if(Auth::attempt(['email' => \Auth::user()->email,'password' => $request->get('adminpwd')])){
            $user = User::find($request->get('id'));
            $user->password = $request->get('password');
            return 'true';
        }else{
            return 'false';
        }
    }

    public function upload(){
        if ($file = \Request::file('croppedImage')) {
            $path = $this->move($file, Type::find(Type::IMG));
            return $path;
        }else{
            return 'error';
        };
    }
}
