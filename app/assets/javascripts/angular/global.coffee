@app_global = angular.module("ps.global", [])
  .controller('MainCtrl', ["$scope", "$window", "gHelper", ($scope, $window, gHelper)->
    $scope.loading = false
    $scope.isMobile = gon.global_vars.is_mobile
    $scope.isMobileWidth = false
    $scope.gh = gHelper
    $scope.isIE = (version, comparison) ->
      cc = 'IE'
      b = $window.document.createElement('B')
      docElem = $window.document.documentElement
      isIE = null
      if version
        cc += ' ' + version
        if comparison
          cc = comparison+' '+cc
      b.innerHTML = '<!--[if '+cc+']><b id="iecctest"></b><![endif]-->'
      docElem.appendChild(b)
      isIE = !!$window.document.getElementById('iecctest')
      docElem.removeChild(b)
      isIE
    angular.element($window).bind('resize', ->
      if $window.innerWidth < gon.global_vars.mobile_width
        $scope.isMobileWidth = true
      else
        $scope.isMobileWidth = false
      $scope.$apply()
    )
    angular.element(document).ready ->
      $scope.isMobileWidth = if $window.innerWidth < gon.global_vars.mobile_width then true else false
      $scope.$apply()
      if $scope.isIE(9, 'lt')
        $window.alert 'IE버전이 너무 오래됐습니다. IE를 업그레이드 해주세요.'
        $window.location.href = "http://windows.microsoft.com/ko-kr/internet-explorer/download-ie"

      if typeof gon.alert_msg != 'undefined'
        $window.alert gon.alert_msg

  ])

jQuery(document).ready(($)->
  $("a[href='#']").click((e)->
    alert "준비중입니다"
    e.preventDefault()
    e.stopPropagation()
  )
)
