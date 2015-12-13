#=require lib/set-blueimp-gallery
#=require client/base-default

@my_app.controller("ClientRoomView", ['$scope', '$window', ($scope, $window)->
  $scope.top_bg = gon.top_bg

  $scope.room_images = [
    {url:"/uploads/web_images/ex/room_slide_1.jpg"},
    {url:"/uploads/web_images/ex/room_slide_2.jpg"},
    {url:"/uploads/web_images/ex/room_slide_3.jpg"}
  ]
  $scope.show_carousel_image = (idx) ->
    $("#top-carousel-images a:nth-child("+(idx+1)+") img").click()
    return

])
