class Admin::HomeController < AdminController
  skip_before_filter :authorize, :only => [:login, :login_request]
  def index
  end

  def login
    @no_layout = true
  end

  def logout
    reset_session
    redirect_to admin_login_path, alert: "정상적으로 로그아웃 되었습니다."
  end

  def login_request
    p = PsInfo.take
    logger.debug "@@#{params[:admin_pw]}"
    if !p.authenticate(params[:admin_pw])
      redirect_to admin_login_path, alert: "비밀번호가 일치하지 않습니다."
      return
    else
      session[:is_admin] = true
    end
    redirect_to admin_home_path
  end

  def reserve
    gon.reserve = PsInfo.take.reservation
  end

  def reserve_update
    params[:content] = editor_parse(params[:content])
    if !PsInfo.take.update_attributes(reservation: params[:content])
      redirect_to admin_reserve_edit_path, alert: "오류가 발생했습니다."
      return
    end
    redirect_to admin_reserve_edit_path, alert: "성공적으로 업데이트 되었습니다."
  end

  def top_bg_index
    @ps_info = PsInfo.take
    gon.images = {
      :room_index => @ps_info.top_bg_room_index_url(:thumb),
      :room_detail => @ps_info.top_bg_room_detail_url(:thumb),
      :tour => @ps_info.top_bg_tour_url(:thumb),
      :reservation => @ps_info.top_bg_reservation_url(:thumb),
      :customer => @ps_info.top_bg_customer_url(:thumb),
    }
  end

  def top_bg_update
    if !PsInfo.take.update_attributes(top_bg_params)
      redirect_to admin_top_bg_index_path, alert: "오류가 발생했습니다."
      return
    end
    redirect_to admin_top_bg_index_path, alert: "성공적으로 업데이트 됐습니다."
  end

  private
  def top_bg_params
    params.require(:ps_info).permit(:top_bg_room_index, :top_bg_room_detail, :top_bg_tour, :top_bg_reservation, :top_bg_customer)
  end
end
