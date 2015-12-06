class Admin::FaqController < AdminController
  def index
    gon.faqs = Faq.where(is_public: true).collect{|n| 
      {
        :id => n.id,
        :title => n.title,
        :created_at => n.created_at.to_dtime,
        :edit_url => admin_faq_edit_path(n.id),
        :delete_url => admin_faq_destroy_path(n.id),
      }
    }
  end

  def order_update
    params[:faq_ids].split(",").each do |id|
    end
  end

  def new
    @faq = Faq.new
  end

  def create
    if(a = Faq.create(faq_params)).nil?
      redirect_to admin_faq_new_path, alert: "오류가 발생했습니다."
    end
    redirect_to admin_faq_index_path, alert: "성공적으로 등록되었습니다."
  end

  def edit
    @faq = Faq.find_by_id(params[:id])
    if @faq.nil?
      redirect_to admin_faq_index_path, alert: "존재하지 않는 공지사항입니다."
    end
    gon.faq = {
      :title => @faq.title,
      :content => @faq.content,
      :created_at => @faq.created_at.to_dtime,
    }
  end

  def update
    @faq = Faq.find_by_id(params[:id])
    if @faq.nil?
      redirect_to admin_faq_index_path, alert: "존재하지 않는 공지사항입니다."
    end
    if !@faq.update_attributes(faq_params)
      redirect_to admin_faq_edit_path(params[:id]), alert: "존재하지 않는 공지사항입니다."
    end
    redirect_to admin_faq_index_path, alert: "성공적으로 등록되었습니다."
  end

  def destroy
    @faq = Faq.find_by_id(params[:id])
    if @faq.nil?
      redirect_to admin_faq_index_path, alert: "존재하지 않는 공지사항입니다."
    end
    if !@faq.destroy
      redirect_to admin_faq_index_path, alert: "오류가 발생했습니다."
    end
    redirect_to admin_faq_index_path, alert: "성공적으로 삭제되었습니다."
  end

  private
  def faq_params
    params.require(:faq).permit(:title, :content, :created_at, :is_public)
  end
end
