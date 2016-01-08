class AddFieldsToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :short_description, :text
    add_column :jobs, :description, :text
    add_column :jobs, :image_url, :string
  end
end
