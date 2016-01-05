class CreateJobSkills < ActiveRecord::Migration
  def change
    create_table :job_skills do |t|
      t.string :skill
      t.references :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
