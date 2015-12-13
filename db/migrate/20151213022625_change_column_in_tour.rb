class ChangeColumnInTour < ActiveRecord::Migration
  def change
    change_column :tours, :priority, :integer, :default => 99
  end
end
