class Client::HomeController < ClientController
  def main
    gon.main_images = ["/uploads/web_images/ex/evt_01.jpg", "/uploads/web_images/ex/evt_06.jpg", "/uploads/web_images/ex/evt_03.jpg"].collect{|v| {:url => v}}
  end

  def special
  end

  def tour
  end

  def notice
  end

  def faq
  end
end
