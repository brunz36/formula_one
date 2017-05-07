class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :country
      t.string :engine_manufacturer
      t.integer :debut_year
      t.integer :number_of_constructor_championshiop
      t.integer :number_of_driver_championship
      t.integer :number_of_poles

      t.timestamps
    end
  end
end
