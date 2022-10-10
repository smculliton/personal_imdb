class CreateMovie < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :release_year
      t.string :mpaa_rating
      t.integer :run_time
      t.integer :rotten_tomatoes_score
      t.boolean :oscar_winner

      t.timestamps
    end
  end
end
