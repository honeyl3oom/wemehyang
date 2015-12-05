class CreateNotice < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :title
      t.text :content
      t.boolean :is_public, :default => true

      t.timestamps
    end
  end
end
