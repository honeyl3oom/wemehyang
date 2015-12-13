#=require lib/set-blueimp-gallery
#=require client/base-default

@app.controller("ClientHomeMain", ['$scope', '$window', ($scope, $window)->
  $scope.main_images = gon.main_images
  $scope.show_carousel_image = (idx) ->
    $("#top-carousel-images a:nth-child("+(idx+1)+") img").click()
    return
  $scope.etc = gon.main_etc
  $window.initMap = ->
    jQuery(document).ready(->
      latlng = {lat: 33.272015, lng: 126.669345}
      map = new google.maps.Map(document.getElementById('ps-map'), {
        center: latlng
        zoom: 12
      })
      marker = new google.maps.Marker({
        position: latlng,
        map: map,
        title: '위미향'
      })
    )
])

