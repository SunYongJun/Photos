<?php

namespace App\Http\Controllers\Admin;

use App\Http\Modal\Type;
use App\Photo;
use Illuminate\Http\Request;

use \Illuminate\Support\Facades\Request as HttpRequest;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class VerifyController extends Controller
{
    public function index(){
        $key = HttpRequest::get('type') ? HttpRequest::get('type') : Type::IMG;
        $modal = Type::find($key)->modal;
        $stuffs = $modal::where('status','=',Photo::NO_CHECKED)->get();
        return $stuffs;
    }

    public function store(Request $request){
        foreach ($request->get('ids') as $id){
            Photo::find($id)->update(['status' => $request->get('status')]);
        }
        $this->index();
    }
}
