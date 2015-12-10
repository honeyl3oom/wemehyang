module ApplicationHelper
  def editor_parse(ctt)
    doc = Nokogiri::HTML(ctt)
    doc.search("p, span, div").each do |node|
      tmp_style = node.styles
      tmp_style["line-height"] = "inherit"
      node.styles = tmp_style
    end
    begin
      ActiveRecord::Base.transaction do 
        content_html = doc.inner_html
        doc.search("img").each do |value|
          src = value.attributes["src"].value
          url = URI.parse(src)
          if /\/uploads\/image\/image/.match(src)
            #idx = src.include?("http") ? 6 : 4
            tmp = Image.find_by_id!(src.split("/")[4])
            tmp.update_attributes!(tmp_flag:false)
          elsif src.include?("http")
            a = Image.new(tmp_flag:false)
            a.remote_image_url = src
            if a.save!
              content_html = content_html.gsub(/#{src}/, a.image_url())
            end
          end
        end
        return content_html
      end
    rescue Exception
      # to be raised RecordInvalid if content is nil, should be validates_presence on Editor model
      return nil
    end
  end
end
