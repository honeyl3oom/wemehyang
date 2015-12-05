#= require angular/lib/set-sortable

@app = angular.module('psApp', [
  'ps.global',
  'ui.bootstrap',
  'ui.sortable',
])

@app.controller("AdminMainImageIndex", ["$scope", "$window", ($scope, $window)->
  $scope.images = gon.images
  

  $scope.order_update = ->
    if !confirm("순서를 업데이트 하시겠습니까?")
      return false
    $("#image_ids").val($scope.images.map((i)-> i.id).join(","))
    $(".order-form").submit()
    return

  $scope.delete = (img) ->
    if !confirm("정말 삭제하시겠습니까?")
      return false
    $window.location.href = img.destroy_url


])
