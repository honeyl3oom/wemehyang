class Client::HomeController < ClientController
  def main
    gon.main_images = ["/uploads/web_images/ex/evt_01.jpg", "/uploads/web_images/ex/evt_06.jpg", "/uploads/web_images/ex/evt_03.jpg"].collect{|v| {:url => v}}
  end

  def special
  end

  def tour
  end

  def notice
    gon.notices = Notice.where(is_public: true).collect { |n|
      {
        :title => n.title,
        :content => n.content,
        :created => n.created_at.to_dtime,
        :collapsed => true,
      }

    }
  end

  def faq
    gon.faqs = Faq.where(is_public: true).collect { |n|
      {
        :title => n.title,
        :content => n.content,
        :collapsed => true,
      }

    }
  end
end
