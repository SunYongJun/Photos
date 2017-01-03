angular.module('directives',[]).directive('navBanner',function () {     //导航
    return {
        restrict : 'E',
        templateUrl : '/admin/tpls/layouts/nav.html',
        controller : function ($scope,$rootScope,$http) {
            $http.get('/admin/user/info').success(function ($response) {
                $scope.user = $response;
                $rootScope.listed = true;
            }).error(function () {
                $rootScope.listed = false;
                window.location.href = '/#/login';
            });
        }
    }
}).directive('pwCheck',[function () {  //密码确认
    return {
        require : 'ngModel',
        link : function (scope, ele , attr , ctrl) {
            var otherInput = ele.inheritedData("$formController")[attr.pwCheck];
            ctrl.$parsers.push(function(value) {
                if(value === otherInput.$viewValue) {
                    ctrl.$setValidity("repeat", true);
                    return value;
                }
                ctrl.$setValidity("repeat", false);
            });

            otherInput.$parsers.push(function(value) {
                ctrl.$setValidity("repeat", value === ctrl.$viewValue);
                return value;
            });
        }
    };
}]).directive('photo',function () {     //头像上传modal
    return {
        restrict : 'E',
        templateUrl : '/app/tpls/directives/photoModal.html',
        transclude : true,
        controller : function ($scope,$http, $element, $attrs, $transclude) {
            var img = $element.find('img');
            var input = $element.find('input[name="photo"]');
            var modal = $element.find('#Modal');
            img.cropper({
                aspectRatio: 10 / 10,
                minContainerHeight:400,
                minContainerWidth:400,
            });
            $scope.sub = function () {
                img.cropper('getCroppedCanvas').toBlob(function (photo) {
                    var formData = new FormData();
                    formData.append('croppedImage', photo);
                    $http({
                        url : '/admin/user/upload',
                        method: "POST",
                        processData: false,
                        contentType: false,
                        headers: {
                            'Content-Type': undefined
                        },
                        transformRequest: function (data, headersGetter) {
                            var headers = headersGetter();
                            delete headers['Content-Type'];
                            return formData;
                        }
                    }).success(function ($response) {
                        $scope.user.photo = $response;
                    });
                });
                modal.modal('hide');
            }
            this.cr = function(b) {
                img.one('built.cropper', function () {
                    URL.revokeObjectURL(b);
                }).cropper('reset').cropper('replace', b);
                modal.modal('show');
            }
        }
    }
}).directive('upload',function () {     //头像上传
    return {
        require : '^photo',
        restrict : 'E',
        transclude : true ,
        template : '<input type="file" class="hide" name="photo" ng-model="user.photo">'
        +'<span ng-transclude ng-click="open()"></span>',
        link : function ($scope,ele,attr,photo) {
            $scope.open = function () {
                ele.find('input').trigger('click');
            }
            ele.children('input').on('change',function () {
                var files = this.files;
                var file;
                if (files && files.length) {
                    file = files[0];
                    if (/^image\/\w+$/.test(file.type)) {
                        var blob = URL.createObjectURL(file);
                        photo.cr(blob);
                    } else {
                        window.alert('Please choose an image file.');
                    }
                }
            })
        }
    }
}).directive('pager',function () {
    return {
        restrict : 'E',
        templateUrl : '/app/tpls/directives/pager.html',
        link : function ($scope) {
            $scope.maxSize = 5;
        }
    }
}).directive('navBar',function () {
    return {
        restrict : 'E',
        templateUrl : '/app/tpls/layouts/nav.html',
        controller : function ($scope,$rootScope,$http,$window,$element,$attrs,$transclude) {
            $scope.attempt = false;
            $http.get('/user/info').success(function ($response) {
                $scope.user = $response;
                $scope.attempt = true;
            });
            $scope.logout = function () {
                $http.get('/logout').success(function () {
                    $scope.attempt = false;
                })
            };
            var sl = 1 , bg = $element.find('.nav-background') , wt = $element.find('.w-top');
            angular.element($window).bind('scroll',function(){
                if($(this).scrollTop() > 300){
                    if(sl === 1){
                        bg.fadeIn('slow');
                        wt.fadeIn('slow');
                        sl = 0;
                    }
                }else{
                    if(sl === 0){
                        bg.fadeOut('slow');
                        wt.fadeOut('slow');
                        sl = 1;
                    }
                }
            })
        }
    }
}).directive('carouse',function () {
    return {
        restrict : 'AE',
        templateUrl : '/app/tpls/directives/carouse.html',
        scope : {

        },
        link : function ($scope) {
            $scope.myInterval = 5000;
            $scope.noWrapSlides = false;
            $scope.active = 0;
            var currIndex = 0;
            $scope.slides = [{
             image : '/assets/images/slide4.jpg',
             text : '',
             id : currIndex++
             },{
             image : '/assets/images/slide5.jpg',
             text : '',
             id : currIndex++
             },{
             image : '/assets/images/slide6.jpg',
             text : '',
             id : currIndex
             }];
        }
    }
}).directive('imageUp',function () {
    return {
        restrict : 'E',
        template : '<a ng-click="up()">Submit a photo.</a><input type="file" nv-file-select="" uploader="uploader" class="hide"/>',
        controller : function ($scope,$http, $location,$element, $attrs, $transclude,FileUploader) {
            var CSRF_TOKEN  = (function () {
                var c = document.cookie.split(';');
                for(var i in c){
                    if(c[i].indexOf('XSRF-TOKEN') >= 0){
                        return decodeURIComponent(c[i].split('XSRF-TOKEN=')[1]);
                    }
                }
            })();
            var uploader = $scope.uploader = new FileUploader({
                url: '/photo/upload',
                headers: {
                    'X-XSRF-TOKEN': CSRF_TOKEN
                }
            });
            $scope.up = function () {
                $element.children('[uploader]').trigger('click');
            };
            $element.children('[uploader]').bind('change',function () {
                setTimeout(function () {
                    uploader.queue[0].upload();
                },150)
            });
            uploader.onSuccessItem = function(fileItem, response, status, headers) {
                $location.url('/photo/create?path='+response.path+'&resize_path='+response.resize_path)
            };

        }
    }
});