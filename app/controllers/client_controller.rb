class ClientController < ApplicationController
  layout 'client'
  before_filter :default_var

  def default_var
    id = params[:id] ? params[:id] : 0
    @menu = {
      :home => [client_home_path],
      :room => [room_index_path],
      :reserve => [client_reserve_path],
      :garden => [client_garden_path],
      :customer => [client_notice_path, client_faq_path],
    }
  end
end
