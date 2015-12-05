@my_global
  .service('globalHelper', ["$sce", ($sce)->
    this.html_view = (string)->
      return $sce.trustAsHtml(string)
    return
  ])
