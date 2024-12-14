class CreateJobsTable < ActiveRecord::Migration[8.0]
  def change
    create_table :jobs do |t|
      t.string :queue, null: false
      t.text :job_data, null: false
      t.datetime :run_at
      t.datetime :locked_at
      t.datetime :completed_at
      t.timestamps
    end

    add_index :jobs, :queue
  end
end
