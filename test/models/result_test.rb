# == Schema Information
#
# Table name: results
#
#  id         :integer          not null, primary key
#  number     :integer
#  sign       :string
#  draw_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_results_on_draw_id  (draw_id)
#

require "test_helper"

class ResultTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
