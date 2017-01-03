<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\ControllerBase;
use App\Http\Modal\Type;
use App\Photo;
use Illuminate\Http\Request;

use App\Http\Requests;

class IndexController extends ControllerBase
{
    public function index(){
        $photos = Photo::where('status','=',Photo::VERIFIED)->get();
        return view('home.layouts.index',compact('photos'));
    }
}
