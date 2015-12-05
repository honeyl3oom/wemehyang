class Admin::MainImageController < AdminController
  def index
    gon.images = MainImage.all.collect{|i| {:id => i.id, :url => i.image_url(:thumb), :edit_url => admin_main_image_edit_path(i.id), :destroy_url => admin_main_image_destroy_path(i.id)}}
  end

  def order
    params[:image_ids].split(",").each_with_index do |id, idx|
      if !(a = MainImage.find_by_id(id)).nil?
        a.update_attributes(priority: idx)
      end
    end
    redirect_to admin_main_image_index_path, alert: "성공적으로 업데이트 되었습니다."
  end

  def new
    @main_image = MainImage.new
  end

  def create
    if !(a = MainImage.create(image: params[:image_file], priority: 99))
      redirect_to admin_main_image_new_path, alert: "오류가 발생했습니다. 다시 시도해주세요"
      return
    end
    redirect_to admin_main_image_index_path, alert: "성공적으로 등록되었습니다."
  end

  def edit
    @main_image = MainImage.find_by_id(params[:id])
    if @main_image.nil?
      redirect_to admin_main_image_index_path, alert: "존재하지 않는 이미지 입니다."
      return
    end
    gon.request_form = {
      :image => {
        :url => @main_image.image_url(:thumb)
      }
    }
  end

  def update
    a = MainImage.find_by_id(params[:id])
    if a.nil?
      redirect_to admin_main_image_index_path, alert: "오류가 발생했습니다."
      return
    end
    if !a.update_attributes(image:params[:image_file])
      redirect_to admin_main_image_edit_path(a.id), alert: "오류가 발생했습니다. 다시 시도해주세요"
      return
    end
    redirect_to admin_main_image_index_path, alert: "성공적으로 업데이트 되었습니다."
  end

  def destroy
    a = MainImage.find_by_id(params[:id])
    if a.nil?
      redirect_to admin_main_image_index_path, alert: "오류가 발생했습니다."
      return
    end
    if !a.destroy
      redirect_to admin_main_image_index, alert: "오류가 발생했습니다. 다시 시도해주세요"
      return
    end
    redirect_to admin_main_image_index_path, alert: "성공적으로 삭제되었습니다."
  end


  def etc_index
    @ps_info = PsInfo.take
    if @ps_info.nil?
      @ps_info = PsInfo.create
    end
    gon.ps_info = {
      :p_image => @ps_info.main_pension_image_url(:thumb),
      :t_image => @ps_info.main_tour_image_url(:thumb),
    }
  end

  def etc_update
    p = PsInfo.take
    if params[:p_image]
      p.update_attributes(main_pension_image: params[:p_image])
    end
    if params[:t_image]
      p.update_attributes(main_tour_image: params[:t_image])
    end
    redirect_to admin_main_image_etc_index_path, alert:"성공적으로 업데이트되었습니다."
  end
end
