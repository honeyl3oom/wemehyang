#=require admin/base-default

@app.controller('AdminHomeTopBgIndex', ["$scope", "$window", ($scope, $window)->
  $scope.images = gon.images
  $scope.attach_file = {
    room_index: ""
    tour: ""
    reservation: ""
    customer: ""
  }
  gh = $scope.gh


  $scope.click_file = (type) ->
    $("."+type).click()
    return

  $scope.submit = ->
    $(".submit-form").submit()
    return

  angular.element(document).ready ->
    $(".submit-form input").change((e)->
      num = $(this)[0].files.length
      if num > 0
        $scope.attach_file[$(this).attr("class")] = $(this).val()
        $scope.$apply()
    )

])
