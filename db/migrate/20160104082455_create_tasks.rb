class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :task_status, default: false
      t.integer :job_id
    end
  end
end
