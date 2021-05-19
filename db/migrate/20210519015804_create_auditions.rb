class CreateAuditions < ActiveRecord::Migration[6.0]
  def change
    create_table :auditions do |t|
      t.datetime :date
      t.string :instrument

      t.timestamps
    end
  end
end
