# == Schema Information
#
# Table name: jobs
#
#  id              :integer          not null, primary key
#  name            :string
#  pay_offer       :string
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  job_status      :integer          default(0), not null
#  expiration_date :datetime
#

require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
