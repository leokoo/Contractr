class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
    	t.string :name
    	t.string :pay_offer
    	t.integer :user_id

      t.timestamps null: false
    end
  end
end
