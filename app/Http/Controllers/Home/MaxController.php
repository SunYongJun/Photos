<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\ControllerBase;
use App\Http\Modal\Type;
use App\Max;
use Illuminate\Http\Request;

use App\Http\Requests;

class MaxController extends ControllerBase
{
    public function index(){
        $maxes = Max::all();

        return view('home.max.index',compact('maxes'));
    }

    public function create(){
        return view('home.max.create');
    }

    public function upload(){
        if ($file = \Request::file('uploader')) {
            $path = $this->move($file,Type::find(Type::MAX));
            if($path){
                return view('home.max.upload',compact('path'));
            }else{
                return redirect()->back()->withErrors('格式错误!');
            }
        }else{
            return redirect()->back()->withErrors("上传错误!");
        }
    }
}
