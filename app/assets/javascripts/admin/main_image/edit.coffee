#=require admin/base-default

@app.controller("AdminMainImageEdit", ["$scope", "$window", ($scope, $window)->
  $scope.request_form = gon.request_form
  gh = $scope.gh
  $scope.attach_file = ""

  $scope.submit = (form) ->
    if gh.blank($(".file-input").val())
      $window.alert "변경할 이미지가 없습니다."
      return false
    $(".main-image-form").submit()
    return

  $scope.click_file = ->
    $(".file-input").click()
    return

  angular.element(document).ready ->
    $(".file-input").change((e) ->
      num = $(".file-input")[0].files.length
      if num > 0
        $scope.attach_file = $(".file-input").val()
        $scope.$apply()
    )
])
