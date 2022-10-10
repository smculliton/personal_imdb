class CreateDirector < ActiveRecord::Migration[5.2]
  def change
    create_table :directors do |t|
      t.string :name
      t.integer :birth_year
      t.string :birth_place
      t.boolean :still_active

      t.timestamps
    end
  end
end
