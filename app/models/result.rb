# == Schema Information
#
# Table name: results
#
#  id         :integer          not null, primary key
#  number     :integer
#  sign       :string
#  hour       :string
#  draw_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  serie      :integer
#
# Indexes
#
#  index_results_on_draw_id  (draw_id)
#

class Result < ApplicationRecord
  belongs_to :draw
end
