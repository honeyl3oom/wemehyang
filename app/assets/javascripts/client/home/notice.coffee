#=require client/base-default

@app.controller("ClientHomeNotice", ['$scope', '$window', ($scope, $window)->
  $scope.notices = gon.notices
])
