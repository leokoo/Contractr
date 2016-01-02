class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :bid_value
      t.references :user, index: true, foreign_key: true
      t.references :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
