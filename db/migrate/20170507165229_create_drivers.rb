class CreateDrivers < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :nationality
      t.integer :age
      t.integer :poles
      t.integer :number_of_championships
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
