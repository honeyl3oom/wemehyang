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
if isIE(0, 'lt')
  alert "IE버전이 너무 오래됐습니다. IE를 업그레이드 해주세요."
  window.location.href = "http://windows.microsoft.com/ko-kr/internet-explorer/download-ie"
