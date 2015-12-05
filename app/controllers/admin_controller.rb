class AdminController < ApplicationController
  layout "admin"
  before_filter :admin_set_variables

  def admin_set_variables
    @side_menu = {
      "홈" => [{:icon => 'icon-home'}, [admin_home_path]],
    }
  end
end
