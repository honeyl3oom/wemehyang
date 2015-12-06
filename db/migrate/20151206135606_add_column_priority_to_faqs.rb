class AddColumnPriorityToFaqs < ActiveRecord::Migration
  def change
    add_column :faqs, :priority, :integer, :default => 99
  end
end
