class AddCounterToAudition < ActiveRecord::Migration[6.0]
  def change
    add_column :auditions, :counter, :integer, :default => 0
  end
end
