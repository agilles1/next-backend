class CreateAuditionRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :audition_rooms do |t|
        t.belongs_to :audition
        t.belongs_to :room
      t.timestamps
    end
  end
end
