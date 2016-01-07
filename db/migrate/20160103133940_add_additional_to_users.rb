class AddAdditionalToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter, :text
    add_column :users, :facebook, :text
    add_column :users, :rate, :integer
    add_column :users, :languages, :string
  end
end
