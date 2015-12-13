#=require client/base-default

@app.controller("ClientHomeReserve", ["$scope", ($scope)->
  $scope.top_bg = gon.top_bg
])
