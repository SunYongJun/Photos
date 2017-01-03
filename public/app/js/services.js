angular.module('Services',[]).service('_photo',function ($uibModal,$log,$http,$window) {
    var $scope = this;
    $scope.loadkey = 0 ;
    this.open =  function (photo) {
        var modalInstance = $uibModal.open({
            animation: $scope.animationsEnabled,
            ariaLabelledBy: 'modal-title',
            ariaDescribedBy: 'modal-body',
            templateUrl: '/app/tpls/photo/modal.html',
            controller: 'ModalInstanceCtrl',
            controllerAs: '$ctrl',
            size: 'lg',
            resolve: {
                photo: photo
            }
        });

        modalInstance.result.then(function (selectedItem) {
            $scope.selected = selectedItem;
        }, function () {
            $log.info('Modal dismissed at: ' + new Date());
        });
    };

    this.masonry = function (path,rootScope) {
        angular.element($window).bind('scroll',function(){
            if ($(document).height() - $(this).scrollTop() - $(this).height()<50 && $scope.loadkey === 0){
                $scope.loadkey = 1;
                if(rootScope.page >= rootScope.lastPage){
                    $scope.loadkey = 0 ;
                    return;
                }
                rootScope.page++;
                $http.get(path+'?page='+rootScope.page).success(function ($response) {
                    $scope.loadkey = 0;
                    rootScope.photos = rootScope.photos.concat($response.data);
                });
            }
        });
    }
});