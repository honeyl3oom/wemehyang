class CreatePsInfo < ActiveRecord::Migration
  def change
    create_table :ps_infos do |t|
      t.string :name
      t.string :address
      t.string :ceo
      t.string :phone
      t.string :kakao_id
      t.string :business_number
      t.string :main_pension_image
      t.string :main_tour_image

      t.timestamps
    end
  end
end
