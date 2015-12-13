#=require lib/set-blueimp-gallery
#=require client/base-default

@app.controller("ClientRoomView", ['$scope', '$window', ($scope, $window)->
  $scope.top_bg = gon.top_bg

  $scope.room_images = gon.room_images
  $scope.show_carousel_image = (idx) ->
    $("#top-carousel-images a:nth-child("+(idx+1)+") img").click()
    return

])
