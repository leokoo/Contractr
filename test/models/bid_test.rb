# == Schema Information
#
# Table name: bids
#
#  id         :integer          not null, primary key
#  bid_value  :integer
#  user_id    :integer
#  job_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bid_status :integer          default(0), not null
#

require 'test_helper'

class BidTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
