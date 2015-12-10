class CreateImage < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      t.boolean :tmp_flag, :default => false

      t.timestamps
    end
  end
end
