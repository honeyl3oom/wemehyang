#=require admin/base-default

@app.controller("AdminMainImageNew", ["$scope", "$window", ($scope, $window)->
  $scope.request_form = {
    image:
      url:""
  }
  gh = $scope.gh
  $scope.attach_file = ""

  $scope.submit = (form) ->
    if gh.blank($(".file-input").val())
      $window.alert "파일첨부를 해주세요."
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
