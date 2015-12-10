#=require client/base-default

@app.controller("ClientHomeFaq", ['$scope', '$window', ($scope, $window)->
  $scope.notices = gon.faqs
])
