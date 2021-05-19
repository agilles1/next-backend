class CreateCandidateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :candidate_rooms do |t|
      t.belongs_to :candidate
      t.belongs_to :room

      t.timestamps
    end
  end
end
