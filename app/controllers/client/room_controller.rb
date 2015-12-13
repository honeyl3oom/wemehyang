class Client::RoomController < ClientController
  def index
    gon.top_bg = PsInfo.take.top_bg_room_index_url(:thumb)
  end

  def view
    gon.top_bg = PsInfo.take.top_bg_room_index_url(:thumb)
    gon.room_images = [
      "/uploads/web_images/ex/room_slide_1.jpg",
      "/uploads/web_images/ex/room_slide_2.jpg",
      "/uploads/web_images/ex/room_slide_3.jpg"
    ]
  end
end
