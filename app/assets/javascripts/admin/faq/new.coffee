#=require angular/lib/set-summernote

@app = angular.module('psApp', [
  'ps.global',
  'ui.bootstrap'
  'summernote',
])

@app.controller("AdminFaqNew", ["$scope", "$window", ($scope, $window)->
  $scope.request_form = {
    title: ""
    content: ""
    is_public: "1"
  }

  $scope.summernote_config = summernote_config

  gh = $scope.gh
  $scope.submit = (form) ->
    if gh.blank(form.title)
      $window.alert "제목을 입력해주세요"
      return false

    if gh.blank(form.content)
      $window.alert "내용을 입력해주세요"
      return false

    pre = "#faq_"
    $(pre+"title").val(form.title)
    $(pre+"content").val(form.content)
    $(pre+"is_public").val(form.is_public)

    $(".faq-form").submit()
    return

])
