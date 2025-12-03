class CreateRaces < ActiveRecord::Migration[8.0]
  def change
    create_table :races do |t|
      t.string :name
      t.datetime :race_date
      t.string :course
      t.integer :distance
      t.string :grade

      t.timestamps
    end
  end
end
