@my_global = angular.module('ps.global', [])
  .controller('MainCtrl', ['$scope', '$window', ($scope, $window) ->

    $scope.hostname += ":"+$window.location.port if $window.location.port != "80"
    $scope.hostname_with_prtc = $window.location.protocol+"//"+$scope.hostname
    $scope.request_url = gon.global.request_url

    $scope.isMobile = () ->
      return (/Android|iPhone|iPad|iPod|BlackBerry/i).test(navigator.userAgent || navigator.vendor || window.opera)

    $scope.queryString = () ->
      query_string = {}
      query = window.location.search.substring(1)
      vars = query.split("&")
      i = 0
      while i < vars.length
        pair = vars[i].split("=")
        if typeof query_string[pair[0]] == "undefined"
          query_string[pair[0]] = pair[1]
        else if typeof query_string[pair[0]] == "string"
          arr = [ query_string[pair[0]], pair[1] ]
          query_string[pair[0]] = arr
        else
          query_string[pair[0]].push(pair[1])
        i += 1
      return query_string

    $scope.is_blank = () ->
      ret = false
      for val in arguments
        if typeof val == "undefined" || val == null || val == ""
          ret = true
          break
      return ret

    $scope.valid_check = (attr, target) ->
      if target == null
        return false
      if attr == 'email'
        re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
        return re.test(target)
      if attr == 'phone'
        re = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/
        return re.test(target)
      if attr == 'birth'
        re = /^(1|2)[0-9]{3}-(0[1-9]{1}|1[0-2]{1})$/
        return re.test(target)
      return false

    angular.element(document).ready ->
      if typeof gon.alert_message != 'undefined'
        $window.alert gon.alert_message
        
      if typeof gon.error_eval != 'undefined'
        $window.eval gon.error_eval
  ])

jQuery(document).ready(($)->
  isIE = (version, comparison) ->
    cc = 'IE'
    b = window.document.createElement('B')
    docElem = window.document.documentElement
    isIE = null
    if version
      cc += ' ' + version
      if comparison
        cc = comparison+' '+cc
    b.innerHTML = '<!--[if '+cc+']><b id="iecctest"></b><![endif]-->'
    docElem.appendChild(b)
    isIE = !!window.document.getElementById('iecctest')
    docElem.removeChild(b)
    isIE

  if isIE(9, 'lt')
    window.alert 'IE버전이 너무 오래됐습니다. IE를 업그레이드 해주세요.'
    window.location.href = "http://windows.microsoft.com/ko-kr/internet-explorer/download-ie"
  
  $("a[href='#']").click((e)->
    alert "준비중입니다"
    e.preventDefault()
    e.stopPropagation()
  )
)
