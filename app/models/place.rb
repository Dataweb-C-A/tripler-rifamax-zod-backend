# == Schema Information
#
# Table name: places
#
#  id         :integer          not null, primary key
#  name       :string
#  country    :string
#  state      :string
#  location   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Place < ApplicationRecord
  has_many :raffles, dependent: :destroy

  validates :name, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :location, presence: true
end
