class AddDescriptionToHorses < ActiveRecord::Migration[8.0]
  def change
    add_column :horses, :description, :text
  end
end
