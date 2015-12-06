#=require admin/base-default

@app.controller("AdminNoticeIndex", ["$scope", ($scope)->
  $scope.notices = gon.notices

  $scope.delete = (f) ->
    if !confirm("정말 삭제하시겠습니까?")
      return false
    $window.location.href = f.delete_url
])
