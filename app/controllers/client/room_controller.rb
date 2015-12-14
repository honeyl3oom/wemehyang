class Client::RoomController < ClientController
  def index
    gon.top_bg = PsInfo.take.top_bg_room_index_url(:thumb)
    pre = "/uploads/web_images/ex"
    gon.floor_1_images = [
      pre+"/room_slide_1.jpg",
      pre+"/room_slide_2.jpg",
      pre+"/room_slide_3.jpg",
      pre+"/room_slide_1.jpg",
      pre+"/room_slide_2.jpg",
      pre+"/room_slide_3.jpg",
      pre+"/room_slide_1.jpg",
      pre+"/room_slide_2.jpg",
      pre+"/room_slide_3.jpg",
    ]
    gon.floor_2_images = [
      pre+"/room_slide_1.jpg",
      pre+"/room_slide_2.jpg",
      pre+"/room_slide_3.jpg",
      pre+"/room_slide_1.jpg",
      pre+"/room_slide_2.jpg",
      pre+"/room_slide_3.jpg",
      pre+"/room_slide_1.jpg",
      pre+"/room_slide_2.jpg",
      pre+"/room_slide_3.jpg",
    ]
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
