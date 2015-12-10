class Ajax::HomeController < AjaxController
  def tmp_upload
    status = true
    ret = {
      "tmp_images" => [],
    }
    begin
      Image.transaction do 
        params[:add_file].each_with_index do |f, i|
          tmp = Image.create!(image:f, tmp_flag:true)
          ret["tmp_images"].push({
            "id" => tmp.id,
            "img_url" => tmp.image_url()
          })
        end
      end
    rescue Exception
      status = false
    end
    ret["status"] = status
    render json: ret
  end
end
