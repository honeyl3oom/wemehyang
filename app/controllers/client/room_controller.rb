class Client::RoomController < ClientController
  def index
    gon.top_bg = PsInfo.take.top_bg_room_index_url(:thumb)
    pre = "/uploads/web_images/ex"
    gon.floor_1_images = []
    pre = "/uploads/web_images/tmp/p1/p1_"
    9.times do |i|
      gon.floor_1_images.push(pre+"#{i+1}.jpg")
    end
    gon.floor_2_images = []
    pre = "/uploads/web_images/tmp/p2/p2_"
    9.times do |i|
      gon.floor_2_images.push(pre+"#{i+1}.jpg")
    end
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
