#=require client/base-default

@app.controller("ClientRoomIndex", ['$scope', '$window', ($scope, $window)->
  $scope.top_bg = gon.top_bg
])
