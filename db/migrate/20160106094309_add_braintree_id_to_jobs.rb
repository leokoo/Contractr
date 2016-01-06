class AddBraintreeIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :braintree_transaction_id, :string
  end
end
