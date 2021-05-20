class AddAllowMultiplesToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :group, :boolean, :default => false
  end
end
