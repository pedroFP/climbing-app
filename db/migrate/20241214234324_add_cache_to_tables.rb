class AddCacheToTables < ActiveRecord::Migration[8.0]
  def change
    create_table :caches do |t|
      t.string :key, null: false
      t.text :value, null: false
      t.integer :expires_in
      t.timestamps
    end

    add_index :caches, :key, unique: true
  end
end
