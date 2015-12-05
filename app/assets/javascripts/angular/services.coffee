@app_global
  .service('gHelper', ["$sce", ($sce)->
    this.get_ajax_header = (type) ->
      if type == "default"
        return {"headers":{ "X-CSRF-Token" : $('meta[name="csrf-token"]').attr('content') }}
      if type == "file"
        return {"headers":{ "X-CSRF-Token" : $('meta[name="csrf-token"]').attr('content'), "Content-Type":"multipart/form-data"}}
    this.blank = (src) ->
      return if typeof src == "undefined" || src == null || src == "" then true else false
    this.html_view = (ctt) ->
      return $sce.trustAsHtml(ctt)
    this.get_date = (date) ->
      y = date.getFullYear()
      m = date.getMonth() + 1
      d = date.getDate()
      if m < 10
        m = "0" + m
      if d < 10
        d = "0" + d
      return y + "-" + m + "-" + d
    return
    this.nl2br = (target) ->
      return if target then target.replace(/\r?\n/g, "<br>") else ""
  ])
