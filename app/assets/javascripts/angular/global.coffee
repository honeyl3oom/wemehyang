@app_global = angular.module("ps.global", [])
  .controller('MainCtrl', ["$scope", "$window", "gHelper", ($scope, $window, gHelper)->
    $scope.loading = false
    $scope.isMobile = gon.global_vars.is_mobile
    $scope.isMobileWidth = false
    $scope.gh = gHelper
    angular.element($window).bind('resize', ->
      if $window.innerWidth < gon.global_vars.mobile_width
        $scope.isMobileWidth = true
      else
        $scope.isMobileWidth = false
      $scope.$apply()
    )
    angular.element(document).ready ->
      $scope.isMobileWidth = if $window.innerWidth < gon.global_vars.mobile_width then true else false
      $scope.$apply()

      if typeof gon.alert_msg != 'undefined'
        $window.alert gon.alert_msg

])


