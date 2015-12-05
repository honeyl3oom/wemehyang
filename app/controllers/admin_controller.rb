class AdminController < ApplicationController
  layout "admin"
  before_filter :admin_set_variables

  def admin_set_variables
    @global_var["meta"]["title"] = "위미향 관리자"
    id = params[:id] ? params[:id] : 0
    @side_menu = {
      "홈" => [{:icon => 'icon-home'}, [admin_home_path]],
      "이미지관리" => [{:icon => 'icon-notebook'}, {
        "메인상단이미지" => [admin_main_image_index_path, admin_main_image_new_path, admin_main_image_edit_path(id)],
        "메인하단이미지" => [admin_main_image_etc_index_path],
      }],
    }
  end
end
