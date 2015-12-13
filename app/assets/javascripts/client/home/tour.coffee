#=require client/base-default

@app.controller("ClientHomeTour", ['$scope', '$window', ($scope, $window)->
  $scope.tours = gon.tours
])

jQuery(document).ready(->
  set_it_size = ->
    size = -1
    $(".it").each(->
      if size < $(this).height()
        size = $(this).height()
    )
    $(".it").css("min-height", size+"px")

  set_it_size()
  $(window).resize(->
    set_it_size()
  )
)
