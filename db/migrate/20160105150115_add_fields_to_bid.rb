class AddFieldsToBid < ActiveRecord::Migration
  def change
  	add_column :bids, :uuid, :string
  	add_column :bids, :delivery_period, :integer
  end
end
