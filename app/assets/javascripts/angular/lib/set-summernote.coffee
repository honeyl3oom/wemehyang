#=require codemirror
#=require summernote
#=require angular-summernote

@summernote_config = {
  lang:'ko-KR'
  toolbar: [
    ['style', ['style']],
    ['font', ['bold', 'italic', 'underline', 'superscript', 'subscript', 'strikethrough', 'clear']],
    ['color', ['color']],
    ['para', ['ul', 'ol', 'paragraph']],
    ['insert', ['link', 'picture', 'table', 'video', 'hr']],
    ['view', ['fullscreen', 'codeview']],
    ['help', ['help']]
  ]
  maximumImageFileSize:1024*1024*10
  height:350
  codemirror:
    lineNumbers:true
    tabSize:2
}

#$.summernote.lang["ko-KR"].image.maximumFileSize = "이미지 최대 용량"

@app_global.controller("SummernoteCtrl", ["$scope", "$window", "gHelper", "$http", ($scope, $window, gHelper, $http )->
  $scope.summernote_image_upload = (files) ->
    #should be editorable="summernote_editable" in summernote 
    if $scope.isIE(10, 'lt')
      if confirm("이미지 첨부는 IE 10 이상에서만 가능합니다. 사용하고 계신 IE를 업데이트 하시겠습니까? (보안상 업데이트 하시는게 좋습니다!)")
        $window.open("http://windows.microsoft.com/ko-kr/internet-explorer/download-ie", "_blank")
      return
    flag = false
    size = 1024*1024*10
    for f in files
      if f.size > size
        flag = true
        break
    if flag
      $window.alert "파일 업로드 중에 오류가 발생하였습니다. 파일 사이즈(최대 10MB)나 형식을 확인해주세요."
      return false
    formData = new FormData()
    for f in files
      formData.append("add_file[]", f)
    $http({
      method:"POST"
      url: "/ajax/tmp_upload"
      headers: {"Content-Type":undefined}
      data: formData
      transformRequest: (data) ->
        return data
    }).success((data)->
      editor = $.summernote.eventHandler.getModule()
      if data.status
        for i in data.tmp_images
          editor.insertImage($scope.summernote_editable, i.img_url)
      else
        $window.alert '이미지 업로드에 실패하였습니다'
    ).error((data)->
        $window.alert '이미지 업로드에 실패하였습니다'
    )
])
