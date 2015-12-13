#= require angular/lib/set-sortable
@app = angular.module('psApp', [
  'ps.global',
  'ui.bootstrap',
  'ui.sortable',
])

@app.controller("AdminTourIndex", ["$scope", "$window", ($scope, $window)->
  $scope.tours = gon.tours

  $scope.delete = (f) ->
    if !confirm("정말 삭제하시겠습니까?")
      return false
    $window.location.href = f.delete_url

  $scope.order_update = ->
    if !confirm("순서를 업데이트 하시겠습니까?")
      return false
    $("#tour_ids").val($scope.tours.map((i)-> i.id).join(","))
    $(".order-form").submit()
    return
])
