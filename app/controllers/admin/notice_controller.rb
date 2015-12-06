class Admin::NoticeController < AdminController
  def index
    gon.notices = Notice.where(is_public: true).collect{|n| 
      {
        :id => n.id,
        :title => n.title,
        :is_public => n.is_public,
        :created_at => n.created_at.to_dtime,
        :edit_url => admin_notice_edit_path(n.id),
        :delete_url => admin_notice_destroy_path(n.id),
      }
    }
  end

  def new
    @notice = Notice.new
  end

  def create
    if(a = Notice.create(notice_params)).nil?
      redirect_to admin_notice_new_path, alert: "오류가 발생했습니다."
    end
    redirect_to admin_notice_index_path, alert: "성공적으로 등록되었습니다."
  end

  def edit
    @notice = Notice.find_by_id(params[:id])
    if @notice.nil?
      redirect_to admin_notice_index_path, alert: "존재하지 않는 공지사항입니다."
    end
    gon.notice = {
      :title => @notice.title,
      :content => @notice.content,
    }
  end

  def update
    @notice = Notice.find_by_id(params[:id])
    if @notice.nil?
      redirect_to admin_notice_index_path, alert: "존재하지 않는 공지사항입니다."
    end
    if !@notice.update_attributes(notice_params)
      redirect_to admin_notice_edit_path(params[:id]), alert: "오류가 발생했습니다."
    end
    redirect_to admin_notice_index_path, alert: "성공적으로 등록되었습니다."
  end

  def destroy
    @notice = Notice.find_by_id(params[:id])
    if @notice.nil?
      redirect_to admin_notice_index_path, alert: "존재하지 않는 공지사항입니다."
    end
    if !@notice.destroy
      redirect_to admin_notice_index_path, alert: "오류가 발생했습니다."
    end
    redirect_to admin_notice_index_path, alert: "성공적으로 삭제되었습니다."
  end

  private
  def notice_params
    params.require(:notice).permit(:title, :content, :created_at, :is_public)
  end
end
