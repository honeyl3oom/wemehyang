class AddColumnsToTours < ActiveRecord::Migration
  def change
    add_column :tours, :addr, :string
    add_column :tours, :time, :string
  end
end
