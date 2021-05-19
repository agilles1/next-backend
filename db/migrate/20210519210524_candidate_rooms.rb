class CandidateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :candidate_rooms do |t|
      t.belongs_to :rooms
      t.belongs_to :candidates

      t.timestamps
    end
  end
end
