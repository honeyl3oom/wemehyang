class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :client_set_variables
  include RoutesHelper

  def client_set_variables
    @js_controller_action = (Rails.application.assets.find_asset "#{params[:controller]}/#{params[:action]}.js").nil? ? nil : "#{params[:controller]}/#{params[:action]}"
    @current_uri = request.path
    @hostname = request.host
    @hostname += ":#{request.port}" if request.port != 80
    @web_img_path = web_img_path
    @pension_name = "위미향"
    @title ||= @pension_name
    @meta_type ||= "website"
    @meta_title ||= @pension_name
    @meta_site_name ||= @pension_name
    @meta_url ||= request.original_url
    @meta_image ||= @web_img_path+"/common/share.jpg"
    @meta_description ||= "안녕하세요, 위할 위, 아름아울 미, 향기 향 위미향 펜션입니다."
    @this_url = @current_uri
    gon.clear
    if flash[:alert] && flash[:alert] != ""
      gon.alert_message = flash[:alert]
      flash[:alert] = ""
    end
    gon.global.push({
      :controller => params[:controller],
      :action => params[:action],
      :request_url => @current_uri,
      :meta_url => @meta_url,
      :web_img_path => @web_img_path,
    })
  end
end
