class AddUserToClimbingPlace < ActiveRecord::Migration[8.0]
  def change
    add_reference :climbing_places, :user, foreign_key: true
  end
end
