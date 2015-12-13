#=require admin/base-default

@app.controller("AdminTourEdit", ["$scope", "$window", ($scope, $window)->
  $scope.request_form = gon.tour
  $scope.attach_file = ""
  $scope.click_file = ->
    $("#tour_image").click()
    return

  gh = $scope.gh
  $scope.submit = (form) ->
    if gh.blank(form.title)
      $window.alert "제목을 입력해주세요"
      return false

    if gh.blank(form.addr)
      $window.alert "주소를 입력해주세요"
      return false

    if gh.blank(form.time)
      $window.alert "시간을 입력해주세요"
      return false

    if gh.blank(form.content)
      $window.alert "내용을 입력해주세요"
      return false

    pre = "#tour_"
    $(pre+"title").val(form.title)
    $(pre+"addr").val(form.addr)
    $(pre+"time").val(form.time)
    $(pre+"content").val(form.content)
    $(pre+"is_public").val(form.is_public)

    $(".tour-form").submit()
    return

  angular.element(document).ready ->
    $("#tour_image").change((e) ->
      num = $("#tour_image")[0].files.length
      if num > 0
        $scope.attach_file = $("#tour_image").val()
        $scope.$apply()
    )

])
