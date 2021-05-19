class CandidateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :candidate_rooms do |t|
      t.belongs_to :room
      t.belongs_to :candidate

      t.timestamps
    end
  end
end
