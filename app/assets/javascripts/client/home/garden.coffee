#=require lib/set-blueimp-gallery
#=require client/base-default

@app.controller("ClientHomeGarden", ['$scope', '$window', ($scope, $window)->
  $scope.top_bg = gon.top_bg
  $scope.floor_1_images = gon.floor_1_images
  $scope.floor_2_images = gon.floor_2_images
  $scope.show_carousel_image = (type, idx) ->
    cname = if type == 1 then "#floor-1-images" else "#floor-2-images"
    $(cname + " a:nth-child("+(idx+1)+") img").click()
    return

])
