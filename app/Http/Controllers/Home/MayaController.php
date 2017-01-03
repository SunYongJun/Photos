<?php

namespace App\Http\Controllers\Home;

use App\Maya;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class MayaController extends Controller
{
    public function index(){
        Maya::all();
    }
}
