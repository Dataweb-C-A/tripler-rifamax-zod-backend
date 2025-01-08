# == Schema Information
#
# Table name: draws
#
#  id               :integer          not null, primary key
#  title            :string
#  key              :string
#  draw             :string
#  length           :integer
#  last_result_seen :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require "test_helper"

class DrawTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
