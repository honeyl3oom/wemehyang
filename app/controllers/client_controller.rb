class ClientController < ApplicationController
  layout 'client'
  before_filter :default_var

  def default_var
    id = params[:id] ? params[:id] : 0
    @menu = {
      :home => [client_home_path],
      :room => [room_index_path, room_view_path],
      :special => [client_special_path, client_tour_path],
      :customer => [client_notice_path, client_faq_path],
    }

  end
end
