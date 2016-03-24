class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_variables
  include RoutesHelper
  include ApplicationHelper


  def set_variables
    @global_var = {
      "js_include" => (Rails.application.assets.find_asset "#{params[:controller]}/#{params[:action]}.js").nil? ? nil : "#{params[:controller]}/#{params[:action]}",
      "hostname" => request.port != 80 ? "#{request.host}:#{request.port}" : request.host,
      "meta" => {
        "title" => "위미향",
        "type" => "website",
        "site_name" => "위미향",
        "url" => request.original_url,
        "image" => "",
        "description" => "안녕하세요, 위할 위, 아름아울 미, 향기 향 위미향 펜션입니다.",
      },
    }
    @web_img_path = "http://#{@global_var["hostname"]}/uploads/web_images"
    @current_uri = request.path
    @phone = "010-4796-1111"

    gon.clear
    if flash[:alert] && flash[:alert] != ""
      gon.alert_msg = flash[:alert]
      flash[:alert] = ""
    end

    gon.global_vars = {
      "web_img_path" => @web_img_path,
      "is_mobile" => check_mobile,
      "mobile_width" => 750,
    }
  end

  def check_mobile
    return (request.user_agent =~ /Android|iPhone|iPad|iPod|BlackBerry/).nil? ? false : true
  end
end
