class CreateHorses < ActiveRecord::Migration[8.0]
  def change
    create_table :horses do |t|
      t.string :name
      t.string :sire
      t.string :mare
      t.string :trainer
      t.string :owner
      t.date :birthday

      t.timestamps
    end
  end
end
