class AddAllowMultiplesToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :holding, :boolean, :default => false
  end
end
