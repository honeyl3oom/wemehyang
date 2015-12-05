class CreateMainImages < ActiveRecord::Migration
  def change
    create_table :main_images do |t|
      t.string :image
      t.integer :priority
      t.integer :is_public, :default => true

      t.timestamps
    end
  end
end
