class CreateFavorites < ActiveRecord::Migration[8.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :horse, null: false, foreign_key: true
      t.text :memo

      t.timestamps
    end
  end
end
