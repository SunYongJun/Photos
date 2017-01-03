<?php

namespace App\Http\Controllers\Admin;

use App\Photo;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class PhotoController extends Controller
{
    public function index(){
        return Photo::with('user')->filter()->paginate(10);
    }
}
