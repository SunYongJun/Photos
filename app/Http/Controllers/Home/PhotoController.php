<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\ControllerBase;
use App\Http\Modal\Type;
use App\Http\Plugins\Image;
use App\Photo;
use Illuminate\Http\Request;

use App\Http\Requests;

class PhotoController extends ControllerBase
{
    public function index(){
        return Photo::paginate(10);
    }
    public function create(){
        return view('home.photo.create');
    }

    public function upload(){
        if ($file = \Request::file('file')) {
            $path = $this->move($file,Type::find(Type::IMG));
            $resize_path = Image::resize(public_path().$path,'/assets/resize/'.date('Ymd',time()));
            return compact('path','resize_path');
        }else{
            return response('error',401);
        }
    }
    
    public function store(Request $request){
        if($result = \Auth::user()->photos()->create($request->all())){
            return $request;
        }else{
            return response('error',401);
        }
    }

    public function show($id){
        $photo = Photo::find($id);
        return view('home.photo.show',compact('photo'));
    }

    public function download($id){
        $file = public_path().Photo::find($id)['path'];
        if(is_file($file)){
            return response()->download($file);
        }else{
            return response(['error'=>'The file does not exist']);
        }

    }
}
