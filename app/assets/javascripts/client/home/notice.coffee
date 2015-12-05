#=require client/base-default

@app.controller("ClientHomeNotice", ['$scope', '$window', ($scope, $window)->
  $scope.notices = [
    {
      title:"안녕하세요, 위미향입니다."
      created:"2015-11-01"
      content:"안녕하세요, 위미향입니다.<br><br>잘부탁드립니다!"
    }
  ]
  for notice in $scope.notices
    notice.collapsed = true
])
