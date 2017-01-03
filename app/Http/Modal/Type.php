<?php

namespace App\Http\Modal;

use Illuminate\Support\Facades\Config;

class Type
{
    const IMG = 0;
    const MAX = 1;
    const  MAYA = 2;

    public $name;
    public $suffix;
    public $path;
    public $key;
    public $modal;

    public $instance;

    public static $all = [
            [
                'name' => '图片',
                'path' => 'photo',
                'modal' => 'App\Photo',
                'suffix' => ['jpg','png','gif']
            ],
            [
                'name' => '3D MAX',
                'path' => 'max',
                'modal' => 'App\Max',
                'suffix' => ['max','3ds','zip']
            ],
            [
                'name' => '玛雅',
                'path' => 'maya',
                'modal' => 'App\Maya',
                'suffix' => ['ma','mb','zip']
            ]
        ];

    public function __construct($type)
    {
        if(!in_array($type,array_keys(self::$all))){
            return null;
        }
        $modal = self::$all[$type];
        $this->name = $modal['name'];
        $this->suffix = $modal['suffix'];
        $this->path = $modal['path'];
        $this->modal = $modal['modal'];
    }

    public static function all(){
        $stack = new \SplQueue();
        foreach (self::$all as $key => $modal){
            $stack->enqueue(new static($key));
        }
        return $stack;
    }

    public static function find($key){
        return new static($key);
    }
}
