<?php

namespace App\Http\Controllers;

use App\Http\Modal\Type;
use Illuminate\Http\Request;

use App\Http\Requests;

class ControllerBase extends Controller
{
    protected function isAjax(){
        return \Illuminate\Support\Facades\Request::ajax();
    }

    protected function move($file,Type $type){

            $allowed_extensions = $type->suffix;
            if ($file->getClientOriginalExtension() && !in_array($file->getClientOriginalExtension(), $allowed_extensions)) {
                return false;
            }

            $fileName        = $file->getClientOriginalName();
            $extension       = $file->getClientOriginalExtension() ?: 'png';
            $folderName      = '/assets/uploads/'.$type->path.'/'.date('Ymd', time()).'/';
            $destinationPath = public_path().$folderName;
            $safeName        = uniqid().'.'.$extension;
            $file->move($destinationPath, $safeName);

            return $filePath = $folderName.$safeName;
    }
}
