class CreateActionCableTables < ActiveRecord::Migration[8.0]
  def change
    create_table :action_cable_subscriptions do |t|
      t.string :channel
      t.string :stream
      t.references :user, foreign_key: true, null: false # Example: associate with a user model
      t.timestamps
    end

    add_index :action_cable_subscriptions, [:channel, :stream]
  end
end
