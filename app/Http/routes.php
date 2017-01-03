<?php

/*
|--------------------------------------------------------------------------
| Routes File
|--------------------------------------------------------------------------
|
| Here is where you will register all of the routes in an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

/*Route::get('/', function () {
    return view('welcome');
});*/

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| This route group applies the "web" middleware group to every route
| it contains. The "web" middleware group is defined in your HTTP
| kernel and includes session state, CSRF protection, and more.
|
*/

Route::group(['namespace' => 'Home' , 'middleware' => ['web','types']],function(){
    Route::get('/',function(){
        return redirect('/index.html');
    });
    Route::get('/photo','PhotoController@index');
    Route::get('/maya','MayaController@index');
    Route::get('/max','MaxController@index');

    Route::group(['middleware' => ['auth']],function(){
        Route::get('/photo/create','PhotoController@create');
        Route::post('/photo/upload','PhotoController@upload');
        Route::post('/photo','PhotoController@store');
        Route::get('/photo/download/{id}','PhotoController@download');

        Route::get('/max/create','MaxController@create');
        Route::post('/max/upload','MaxController@upload');
        Route::post('/max','MaxController@store');
        Route::get('/max/download/{id}','PhotoController@download');
        Route::get('/max/{id}','PhotoController@show');
        

        Route::get('/user','UserController@index');
        Route::get('/user/info','UserController@info');
        Route::get('/user/photos','UserController@photos');
        Route::post('/user/photo','UserController@photo');
        Route::put('/user','UserController@update');

    });
    Route::get('/photo/{id}','PhotoController@show');

});

Route::group(['prefix' => 'admin','namespace' => 'Admin','middleware' => ['web','auth']],function(){
    Route::get('/','IndexController@index');

    Route::get('/user/info','UserController@info');
    Route::get('/user/all','UserController@all');
    Route::get('/user','UserController@index');
    Route::post('/user/upload','UserController@upload');
    Route::put('/user/pwdupdate','UserController@pwdupdate');
    Route::get('/user/{id}','UserController@show');
    Route::put('/user/{id}','UserController@update');

    Route::get('/photo','PhotoController@index');

    Route::get('/verify','VerifyController@index');
    
    Route::post('/verify','VerifyController@store');

    Route::post('/user','UserController@store');
});

Route::group(['middleware' => 'web'], function () {
    Route::auth();
});

