#=require client/base-default

@app.controller("ClientHomeFaq", ['$scope', '$window', ($scope, $window)->
  $scope.top_bg = gon.top_bg
  $scope.notices = gon.faqs
])
