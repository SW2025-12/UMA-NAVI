class CreateEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :entries do |t|
      t.references :horse, null: false, foreign_key: true
      t.references :race, null: false, foreign_key: true
      t.integer :rank
      t.string :jockey
      t.integer :weight
      t.decimal :odds
      t.string :payout

      t.timestamps
    end
  end
end
