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

class Draw < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :schedules, dependent: :destroy
end
