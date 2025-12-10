class AddDetailsToRaces < ActiveRecord::Migration[8.0]
  def change
    add_column :races, :date, :date
    add_column :races, :location, :string
  end
end
