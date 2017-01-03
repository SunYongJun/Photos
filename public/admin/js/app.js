var routeModule = angular.module('RouteModule',['ngRoute','ctrlModule','directives','ui.bootstrap']);

routeModule.config(['$routeProvider',function ($routeProvider) {
    $routeProvider.when('/verify',{
        templateUrl:'/admin/tpls/verify/index.html',
        controller:'VerifyCtrl'
    }).when('/user',{
        templateUrl:'/admin/tpls/user/index.html',
        controller:'UserCtrl'
    }).when('/user/add',{
        templateUrl:'/admin/tpls/user/add.html',
        controller:'UserAddCtrl'
    }).when('/user/edit/:id',{
        templateUrl : '/admin/tpls/user/edit.html',
        controller:'UserEditCtrl'
    }).when('/photo',{
        templateUrl : '/admin/tpls/photo/index.html',
        controller:'PhotoCtrl'
    }).otherwise({
        redirectTo : '/verify'
    });
}]);