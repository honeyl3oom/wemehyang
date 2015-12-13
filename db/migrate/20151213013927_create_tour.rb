class CreateTour < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :title
      t.string :image
      t.text :content
      t.boolean :is_public, :default => true
      t.integer :priority, :default => 0

      t.timestamps
    end
  end
end
