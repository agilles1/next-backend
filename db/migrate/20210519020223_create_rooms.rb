class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer :fill_order
      t.string :name
      t.belongs_to :audition

      t.timestamps
    end
  end
end
