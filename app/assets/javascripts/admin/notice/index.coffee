#=require admin/base-default

@app.controller("AdminNoticeIndex", ["$scope", "$window", ($scope, $window)->
  $scope.notices = gon.notices

  $scope.delete = (f) ->
    if !confirm("정말 삭제하시겠습니까?")
      return false
    $window.location.href = f.delete_url
])
