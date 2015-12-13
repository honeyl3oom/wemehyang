#=require client/base-default

@my_app.controller("ClientRoomIndex", ['$scope', '$window', ($scope, $window)->
  $scope.top_bg = gon.top_bg
])
