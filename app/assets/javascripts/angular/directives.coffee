@app_global
  .directive('url',["$window", ($window)->
    return {
      restrict: 'A',
      link: (scope, elem, attrs) ->
        newFlag = if attrs.newWindow != undefined then true else false
        windowName = if attrs.windowName != undefined then attrs.windowName else '_blank'
        windowOption = if attrs.windowOption != undefined then attrs.windowOption else ''
        elem.on('click', ->
          if attrs.url == "#"
            $window.alert "준비중입니다. 조금만 기다려주세요!"
            return false
          if newFlag
            $window.open(attrs.url, windowName, windowOption)
          else
            $window.location.href = attrs.url
        )
        elem.css('cursor', 'pointer')
        return
    }
  ])
  .directive('verticalCenter', [() ->
    return {
      link: (scope, elem, attrs) ->
        target = attrs.verticalCenter
        parentHeight = 0
        targetElem = $(elem).closest(target)
        parentChangeHeight = ->
          parentHeight = $(targetElem).height()
          return parentHeight
        my_h = 0
        myHeight = ->
          my_h = $(elem).height()
          return my_h

        scope.$watch( ->
          return {
            "height":parentChangeHeight()
            "my_height":myHeight()
          }
        , (val) ->
          my_height = val.my_height
          target_height = val.height
          top_pos = (target_height - my_height)/2
          top_pos = if target_height < my_height then 10 else top_pos
          position_css = if $(elem).css("position") == "absolute" then "absolute" else "relative"
          $(targetElem).css({
            position:"relative"
          })
          $(elem).css({
            position:position_css
            top:top_pos+"px"
          })
        , true)
    }
  ])
  .directive('blueimpGalleryImg', ['$window', ($window)->
    return {
      restrict: 'A'
      link: (scope, elem, attrs) ->
        if !$window.blueimp.Gallery
          $window.alert '이미지 라이브러리 로딩을 해주세요!'
        else
          if !$window.document.getElementById("blueimp-gallery")
            $("body").append("
              <div id='blueimp-gallery' class='blueimp-gallery'>
                <div class='slides'></div>
                <h3 class='title'></h3>
                <a class='prev'></a>
                <a class='next'></a>
                <a class='close'></a>
              </div>
            ")
          elem.on("click", ".photo-close, .photo-close-cancel", ->
            return false
          )
          elem.on("click", "a", (event)->
            target = event.target or event.srcElement
            link = target.parentNode # should be a link node
            options =
              index: link
              event: event
              slideLoadingClass: "image-loading"
            links = $(elem).find("a")
            $window.blueimp.Gallery(links, options)
          )
    }
  ])

