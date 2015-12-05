#=require client/base-default

@my_app.controller("ClientHomeFaq", ['$scope', '$window', 'globalHelper', ($scope, $window, globalHelper)->
  $scope.ghelper = globalHelper
  $scope.notices = [
    {
      title:"요금결제 방식은 어떻게 되나요?"
      content:"객실 요금결제는 현금 (무통장입금)만 가능하며, 지정계좌로 전액입금 하셔야 예약이 완료됩니다.<br>카드를 원하시는 경우 이용 당일 체크인 하실때 환불후 재결제 가능하십니다."
    }
    {
      title:"환불규정은 어떻게 되어있나요?"
      content:"입금 후 예약최소시 고객센터로 연락을 하셔서 환불 안내를 받으시기 바랍니다.<br>환불 기준은 아래와 같으므로 신중하게 예약을 취소 또는 변경하시기 당부 드립니다."
    }
  ]
  for notice in $scope.notices
    notice.collapsed = true
])
