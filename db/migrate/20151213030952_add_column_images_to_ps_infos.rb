class AddColumnImagesToPsInfos < ActiveRecord::Migration
  def change
    add_column :ps_infos, :top_bg_room_index , :string
    add_column :ps_infos, :top_bg_room_detail , :string
    add_column :ps_infos, :top_bg_tour , :string
    add_column :ps_infos, :top_bg_reservation , :string
    add_column :ps_infos, :top_bg_customer , :string
  end
end
