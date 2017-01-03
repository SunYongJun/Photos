<?php
namespace App\Http\Plugins;

use Illuminate\Support\Facades\Storage;

class Image{

    /*
     * desription 压缩图片
     * @param sting $imgsrc 图片路径
     * @param string $imgdst 压缩后保存路径
     */
    public static function resize($imgsrc,$path){
        $pdst = public_path().$path;
        if(!is_dir($pdst)){
            mkdir($pdst);
        }
        list($width,$height,$type)=getimagesize($imgsrc);
        $new_width = $width > 800 ? 800 : $width;
        $new_height = $new_width / $width * $height;
        switch($type){
            case 1:
                $filename = date('His',time()).uniqid().'.gif';
                $imgdst = $pdst.'/'.$filename;
                Storage::put($imgdst, '');
                $giftype = self::check_gifcartoon($imgsrc);
                if($giftype){
                    header('Content-Type:image/gif');
                    $image_wp=imagecreatetruecolor($new_width, $new_height);
                    $image = imagecreatefromgif($imgsrc);
                    imagecopyresampled($image_wp, $image, 0, 0, 0, 0, $new_width, $new_height, $width, $height);
                    imagejpeg($image_wp, $imgdst,75);
                    imagedestroy($image_wp);
                }
                break;
            case 2:
                header('Content-Type:image/jpeg');
                $filename = date('His',time()).uniqid().'.jpg';
                $imgdst = $pdst.'/'.$filename;
                Storage::put($imgdst, '');
                $image_wp=imagecreatetruecolor($new_width, $new_height);
                $image = imagecreatefromjpeg($imgsrc);
                imagecopyresampled($image_wp, $image, 0, 0, 0, 0, $new_width, $new_height, $width, $height);
                imagejpeg($image_wp, $imgdst,75);
                imagedestroy($image_wp);
                break;
            case 3:
                header('Content-Type:image/png');
                $filename = date('His',time()).uniqid().'.png';
                $imgdst = $pdst.'/'.$filename;
                $image_wp=imagecreatetruecolor($new_width, $new_height);
                $image = imagecreatefrompng($imgsrc);
                imagecopyresampled($image_wp, $image, 0, 0, 0, 0, $new_width, $new_height, $width, $height);
                imagejpeg($image_wp, $imgdst,75);
                imagedestroy($image_wp);
                break;
        }

        return $path.'/'.$filename;
    }
    /*
     * desription 判断是否gif动画
     * @param sting $image_file图片路径
     * @return boolean t 是 f 否
     */
    public static function check_gifcartoon($image_file){
        $fp = fopen($image_file,'rb');
        $image_head = fread($fp,1024);
        fclose($fp);
        return preg_match("/".chr(0x21).chr(0xff).chr(0x0b).'NETSCAPE2.0'."/",$image_head)?false:true;
    }

}
