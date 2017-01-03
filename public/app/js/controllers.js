angular.module('Ctrl',[]).controller('AuthCtrl',function ($scope,$http,$location,$rootScope) {
    $scope.login = function (user) {
        $http.post('/login',user).success(function ($response) {
            window.history.back();
        }).error(function ($response) {
            $scope.error = $response;
        })
    }
}).controller('RegisterCtrl',function ($scope,$http,$location) {
    $scope.register = function (user) {
        $http.post('/register',user).success(function ($response) {
            $location.path('#/');
        }).error(function ($response) {
            $scope.error = $response;
        })
    }
}).controller('PhotoCtrl',function ($scope,$http,$window,_photo) {
    $http.get('/photo').success(function ($response) {
        $scope.photos = $response.data;
        $scope.lastPage = $response.last_page;
        $scope.page = $response.current_page;
        _photo.masonry('/photo',$scope);
    });
    $scope.open = function(photo){
        _photo.open(photo)
    };

}).controller('ModalInstanceCtrl', function ($scope,$uibModalInstance , photo) {
    $scope.photo = photo;
    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
}).controller('UserCtrl',function ($scope,$http,_photo) {
    $http.get('/user/info').success(function ($response) {
        $scope.user = $response;
    });
    $http.get('/user/photos').success(function ($response) {
        $scope.photos = $response.data;
        $scope.lastPage = $response.last_page;
        $scope.page = $response.current_page;
        _photo.masonry('/user/photos',$scope);
    });
    $scope.$watch('user.photo',function () {
        if('undefined' !== typeof $scope.user){
            $http.put('/user',$scope.user);
        }
    })
    $scope.open = function(photo){
        _photo.open(photo)
    };

}).controller('PhotoCreateCtrl',function ($scope,$location,$http,$log) {
    $scope.photo = $location.search();
    $scope.sub = function (photo) {
        $http.post('/photo',photo).success(function (response) {
            $location.url('/user');
        }).error(function (response) {
            $log(response);
        })
    }
});