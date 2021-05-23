class AddFillOrderToAuditionRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :audition_rooms, :fill_order, :string
  end
end
