class AddRequiredSkillsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :required_skills, :string
  end
end
