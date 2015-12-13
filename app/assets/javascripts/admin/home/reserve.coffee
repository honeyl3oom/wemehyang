#=require angular/lib/set-summernote

@app = angular.module('psApp', [
  'ps.global',
  'ui.bootstrap'
  'summernote',
])

@app.controller("AdminHomeReserve", ["$scope", "$window", ($scope, $window)->
  $scope.request_form = {
    reserve: gon.reserve
  }

  $scope.summernote_config = summernote_config

  gh = $scope.gh
  $scope.submit = (form) ->
    if gh.blank(form.reserve)
      $window.alert "예약 페이지 내용을 입력해주세요"
      return false

    $("#content").val(form.reserve)

    $(".submit-form").submit()
    return

])
