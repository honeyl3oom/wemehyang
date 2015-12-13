class Admin::TourController < AdminController
  def index
    gon.tours = Tour.all.collect{|n| 
      {
        :id => n.id,
        :image => n.image_url,
        :title => n.title,
        :is_public => n.is_public,
        :edit_url => admin_tour_edit_path(n.id),
        :delete_url => admin_tour_destroy_path(n.id),
      }
    }
  end

  def order_update
    params[:tour_ids].split(",").each_with_index do |id, idx|
      f = Tour.find_by_id(id)
      f.update_attributes(priority: idx+1) if !f.nil?
    end
    redirect_to admin_tour_index_path, alert: "순서가 변경되었습니다."
  end

  def new
    @tour = Tour.new
  end

  def create
    if(a = Tour.create(tour_params)).nil?
      redirect_to admin_tour_new_path, alert: "오류가 발생했습니다."
    end
    redirect_to admin_tour_index_path, alert: "성공적으로 등록되었습니다."
  end

  def edit
    @tour = Tour.find_by_id(params[:id])
    if @tour.nil?
      redirect_to admin_tour_index_path, alert: "존재하지 않는 공지사항입니다."
    end
    gon.tour = {
      :title => @tour.title,
      :image => @tour.image_url,
      :addr => @tour.addr,
      :time => @tour.time,
      :content => @tour.content,
      :is_public => @tour.is_public ? "1" : "0",
      :created_at => @tour.created_at.to_dtime,
    }
  end

  def update
    @tour = Tour.find_by_id(params[:id])
    if @tour.nil?
      redirect_to admin_tour_index_path, alert: "존재하지 않는 공지사항입니다."
    end
    if !@tour.update_attributes(tour_params)
      redirect_to admin_tour_edit_path(params[:id]), alert: "존재하지 않는 공지사항입니다."
    end
    redirect_to admin_tour_index_path, alert: "성공적으로 업데이트 되었습니다."
  end

  def destroy
    @tour = Tour.find_by_id(params[:id])
    if @tour.nil?
      redirect_to admin_tour_index_path, alert: "존재하지 않는 공지사항입니다."
    end
    if !@tour.destroy
      redirect_to admin_tour_index_path, alert: "오류가 발생했습니다."
    end
    redirect_to admin_tour_index_path, alert: "성공적으로 삭제되었습니다."
  end

  private
  def tour_params
    params.require(:tour).permit(:title, :image, :content, :addr, :time, :is_public)
  end
end
