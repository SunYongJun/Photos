angular.module('ctrlModule',[]).controller('navtrl',['$scope','$http',function ($scope,$http) {

}]).controller('IndexCtrl',function ($scope) {
    
}).controller('VerifyCtrl',function ($scope,$http) {
    $http.get('/admin/verify').success(function ($response) {
        $scope.photos = $response;
    });
    
    var ids = [];//:checked id集合
    var index = 0;//id在ids的偏移量
    $scope.all = function (master) {
        if(master == true){
            for(var i = 0 ; i < $scope.photos.length; i++){
                ids.push(($scope.photos[i]).id);
            }
        }else{
            ids = [];
        }
    }
    $scope.check = function (id,master) {
        if(master == true){
            if(ids.indexOf(id) < 0){
                ids.push(id);
            }
        }else{
            if((index = ids.indexOf(id)) >= 0){
                ids.splice(index,1);
            }
        }
    }
    $scope.agree = function () {
        if(ids.length > 0){
            $http.post('/admin/verify',{ids:ids,status:1}).success(function ($response) {
                $scope.photos = $response;
            })
        }
    }
    $scope.refuse = function () {
        if(ids.length > 0){
            $http.post('/admin/verify',{ids:ids,status:-1}).success(function ($response) {
                $scope.photos = $response;
            })
        }
    }
}).controller('UserCtrl',function ($scope,$http, $uibModal,$timeout) {
    $scope.bigCurrentPage = 1;
    var paramKey;
    var pointer = true;
    var getUsers = function () {
        if(pointer == true){
            pointer = false;
            paramKey = $scope.keyword ? '&keyword='+$scope.keyword : '';
            $http.get('/admin/user?page='+$scope.bigCurrentPage+paramKey).success(function ($response) {
                $scope.bigTotalItems = $response.last_page * 10;
                $scope.bigCurrentPage = $response.current_page;
                $scope.users = $response.data;
                pointer = true;
            });
        }
    }
    $scope.$watch('bigCurrentPage',function () {
        getUsers();
    });
    var timeoutPromise;
    $scope.$watch('keyword',function () {
        $timeout.cancel(timeoutPromise);
        timeoutPromise = $timeout(function () {
            if('undefined' !== typeof $scope.keyword){
                $scope.bigCurrentPage = 1;
                getUsers();
            }
        },500);
    });
    $scope.animationsEnabled = true;

    $scope.open = function (user) {
        var modalInstance = $uibModal.open({
            animation: $scope.animationsEnabled,
            templateUrl: 'ModalContent.html',
            controller: 'ModalInstanceCtrl',
            size: '',
            resolve: {
                user: function () {
                    return user;
                }
            }
        });

        modalInstance.result.then(function (selectedItem) {
            $scope.selected = selectedItem;
        }, function () {
            // $log.info('Modal dismissed at: ' + new Date());
        });
    };

    $scope.toggleAnimation = function () {
        $scope.animationsEnabled = !$scope.animationsEnabled;
    };
}).controller('ModalInstanceCtrl', function ($scope,$http, $uibModalInstance, user) {

    $scope.user = user;
    $scope.selected = {
        user: $scope.user
    };
    $scope.ok = function () {
        $http.put('/admin/user/pwdupdate',$scope.user);
        $uibModalInstance.close();
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
}).controller('UserEditCtrl',function ($scope,$http,$routeParams,$location) {
    $http.get('/admin/user/'+$routeParams.id).success(function (data) {
        $scope.user = data;
    });
    $scope.edit = function () {
        $http.put('/admin/user/'+$scope.user.id,$scope.user).success(function (data) {
            if('true' === data)
                $location.path('/user');
        })
    }
}).controller('UserAddCtrl',function ($scope,$http,$routeParams,$location) {
    $scope.create = function () {
        $http.post('/admin/user',$scope.user).success(function () {
            $location.path('/user');
        })
    }
}).controller('PhotoCtrl',function ($scope,$http,$timeout,$uibModal) {
    $http.get('/admin/user/all').success(function ($response) {
        $scope.users = $response;
    });
    $scope.bigCurrentPage = 1;
    $scope.statuses = {
        '-1' : '未通过审核',
        '0' : '未审核',
        '1' : '已通过审核'
    };
    var paramKey,paramUid,paramStatus;
    var pointer = true;
    var getPhotos = function () {
        if(pointer == true){
            pointer = false;
            paramKey = $scope.keyword ? '&keyword='+$scope.keyword : '';
            paramUid = $scope.uid ? '&uid='+$scope.uid : '';
            paramStatus = ['-1','0','1'].indexOf($scope.status) >= 0 ? '&status='+$scope.status : '';
            $http.get('/admin/photo?page='+$scope.bigCurrentPage+paramKey+paramUid+paramStatus).success(function ($response) {
                $scope.bigTotalItems = $response.last_page * 10;
                $scope.bigCurrentPage = $response.current_page;
                $scope.photos = $response.data;
                pointer = true;
            });
        }
    }
    $scope.$watch('bigCurrentPage',function () {
        getPhotos();
    });
    var timeoutPromise;
    $scope.$watch('keyword',function () {
        $timeout.cancel(timeoutPromise);
        timeoutPromise = $timeout(function () {
            if('undefined' !== typeof $scope.keyword){
                $scope.bigCurrentPage = 1;
                getPhotos();
            }
        },500);
    });
    $scope.$watch('uid',function () {
        if('undefined' !== typeof $scope.uid){
            getPhotos();
        }
    });
    $scope.$watch('status',function () {
        if('undefined' !== typeof $scope.status){
            getPhotos();
        }
    });
    $scope.show = function (photo) {
        var modalInstance = $uibModal.open({
            animation: $scope.animationsEnabled,
            templateUrl: 'ModalContent.html',
            controller: 'PhotoInstanceCtrl',
            size: 'lg',
            resolve: {
                photo: function () {
                    return photo;
                }
            }
        });

        modalInstance.result.then(function (selectedItem) {
            $scope.selected = selectedItem;
        }, function () {
            // $log.info('Modal dismissed at: ' + new Date());
        });
    };
}).controller('PhotoInstanceCtrl',function ($scope,$uibModalInstance,photo) {
    $scope.photo = photo;
    $scope.selected = {
        photo: $scope.photo
    };
    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});