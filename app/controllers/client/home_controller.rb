class Client::HomeController < ClientController
  def main
    p = PsInfo.take
    gon.main_images = MainImage.where(is_public: true).collect{|v| {:url => v.image_url(:thumb)}}
    gon.main_etc = [p.main_pension_image_url(:thumb), p.main_tour_image_url(:thumb)]
  end

  def reserve
    p = PsInfo.take
    gon.top_bg = p.top_bg_reservation_url(:thumb)
    gon.reserve = p.reservation
  end

  def special
  end

  def tour
    p = PsInfo.take
    gon.top_bg = p.top_bg_tour_url(:thumb)
    gon.tours = Tour.where(is_public: true).collect { |n|
      {
        :title => n.title,
        :image => n.image_url,
        :addr => n.addr,
        :time => n.time,
        :content => n.content,
      }
    }
  end

  def notice
    p = PsInfo.take
    gon.top_bg = p.top_bg_customer_url(:thumb)
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
    p = PsInfo.take
    gon.top_bg = p.top_bg_customer_url(:thumb)
    gon.faqs = Faq.where(is_public: true).collect { |n|
      {
        :title => n.title,
        :content => n.content,
        :collapsed => true,
      }

    }
  end
end
