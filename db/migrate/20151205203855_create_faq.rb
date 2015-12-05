class CreateFaq < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.string :title
      t.text :content
      t.boolean :is_public, :default => true

      t.timestamps
    end
  end
end
