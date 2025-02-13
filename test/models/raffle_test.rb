# == Schema Information
#
# Table name: raffles
#
#  id         :integer          not null, primary key
#  award_date :date
#  status     :string
#  award      :string
#  winner     :integer
#  place_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_raffles_on_place_id  (place_id)
#

require "test_helper"

class RaffleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
