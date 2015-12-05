#=require admin/base-default

@app.controller('AdminMainImageEtcIndex', ["$scope", "$window", ($scope, $window)->
  $scope.ps_info = gon.ps_info
  $scope.attach_file = ["", ""]
  gh = $scope.gh

  $scope.click_file = (type) ->
    if type == "p"
      $(".p-input").click()
    if type == "t"
      $(".t-input").click()
    return

  $scope.submit = ->
    if gh.blank($(".p-input").val()) && gh.blank($(".t-input").val())
      $window.alert "변경할 이미지가 없습니다."
      return false
    $(".submit-form").submit()
    return

  angular.element(document).ready ->
    $(".p-input, .t-input").change((e)->
      num = $(this)[0].files.length
      if num > 0
        console.log $(this).attr("class")
        idx = if $(this).attr("class") == "p-input" then 0 else 1
        $scope.attach_file[idx] = $(this).val()
        $scope.$apply()
    )

])
