class RemoveBelongsTo < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :audition_id
  end
end
