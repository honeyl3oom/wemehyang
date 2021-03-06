class AdminController < ApplicationController
  layout "admin"
  before_filter :authorize
  before_filter :admin_set_variables

  def admin_set_variables
    @global_var["meta"]["title"] = "위미향 관리자"
    id = params[:id] ? params[:id] : 0
    @side_menu = {
      "홈" => [{:icon => 'icon-home'}, [admin_home_path]],
      "이미지관리" => [{:icon => 'icon-picture'}, {
        "메인상단이미지" => [admin_main_image_index_path, admin_main_image_new_path, admin_main_image_edit_path(id)],
        "메인하단이미지" => [admin_main_image_etc_index_path],
        "메뉴별상단이미지" => [admin_top_bg_index_path],
      }],
      #"예약페이지관리" => [{:icon => "icon-docs"}, [admin_reserve_edit_path]],
      "관광지관리" => [{:icon => "icon-direction"}, [admin_tour_index_path, admin_tour_new_path, admin_tour_edit_path(id)]],
      "공지사항관리" => [{:icon => "icon-note"}, [admin_notice_index_path, admin_notice_new_path, admin_notice_edit_path(id)]],
      "FAQ관리" => [{:icon => "icon-speech"}, [admin_faq_index_path, admin_faq_new_path, admin_faq_edit_path(id)]],
    }
  end

  def authorize
    redirect_to admin_login_path, alert: "관리자 로그인이 필요합니다" if !session[:is_admin]
  end
end
