class AddColumnReservationToPsInfo < ActiveRecord::Migration
  def change
    add_column :ps_infos, :reservation, :longtext
  end
end
