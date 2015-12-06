#=require angular/lib/set-summernote

@app = angular.module('csApp', [
  'ps.global',
  'ui.bootstrap'
  'summernote',
])

@app.controller("AdminNoticeNew", ["$scope", "$window", ($scope, $window)->
  $scope.request_form = gon.notice

  $scope.summernote_config = summernote_config

  gh = $scope.gh
  $scope.submit = (form) ->
    if gh.blank(form.title)
      $window.alert "제목을 입력해주세요"
      return false

    if gh.blank(form.content)
      $window.alert "내용을 입력해주세요"
      return false

    pre = "#notice_"
    $(pre+"title").val(form.title)
    $(pre+"content").val(form.content)

    $(".notice-form").submit()
    return

])
