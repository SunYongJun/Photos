angular.module('App',['ngRoute','ngAnimate','ui.bootstrap','angularFileUpload','wu.masonry','Ctrl','directives','Services']).config(['$routeProvider',function ($routeProvider) {
    $routeProvider.when('/login',{
        templateUrl : '/app/tpls/auth/login.html',
        controller : 'AuthCtrl'
    }).when('/register',{
        templateUrl : '/app/tpls/auth/register.html',
        controller : 'RegisterCtrl'
    }).when('/photo',{
        templateUrl : '/app/tpls/photo/index.html',
        controller : 'PhotoCtrl'
    }).when('/user',{
        templateUrl : '/app/tpls/user/index.html',
        controller : 'UserCtrl'
    }).when('/photo/create',{
        templateUrl : '/app/tpls/photo/create.html',
        controller : 'PhotoCreateCtrl'
    }).otherwise({
        redirectTo : '/photo'
    })
}]);