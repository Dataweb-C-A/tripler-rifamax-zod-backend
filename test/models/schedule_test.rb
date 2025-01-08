# == Schema Information
#
# Table name: schedules
#
#  id         :integer          not null, primary key
#  hour       :string
#  draw_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_schedules_on_draw_id  (draw_id)
#

require "test_helper"

class ScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
