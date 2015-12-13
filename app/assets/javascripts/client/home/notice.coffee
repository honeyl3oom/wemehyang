#=require client/base-default

@app.controller("ClientHomeNotice", ['$scope', '$window', ($scope, $window)->
  $scope.top_bg = gon.top_bg
  $scope.notices = gon.notices
])
