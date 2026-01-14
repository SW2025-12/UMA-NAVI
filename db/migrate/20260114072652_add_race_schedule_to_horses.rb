class AddRaceScheduleToHorses < ActiveRecord::Migration[8.0]
  def change
    add_column :horses, :race_schedule, :text
  end
end
