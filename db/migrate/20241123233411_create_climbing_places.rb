class CreateClimbingPlaces < ActiveRecord::Migration[8.0]
  def change
    create_table :climbing_places do |t|
      t.string :name
      t.string :address
      t.string :country
      t.string :country_code
      t.string :link
      t.text :description
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
