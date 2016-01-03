class AddExpirationToJob < ActiveRecord::Migration
  def change
  	add_column :jobs, :expiration_date, :datetime
  end
end