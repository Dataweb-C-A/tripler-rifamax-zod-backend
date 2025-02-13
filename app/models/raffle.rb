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

class Raffle < ApplicationRecord
  belongs_to :place

  STATUES = { pending: 'pending', completed: 'completed' }.freeze

  before_create :initialize_raffle

  validates :award_date, presence: true
  validates :award, presence: true
  validates :place_id, presence: true

  private

  def initialize_raffle
    self.status = STATUES[:pending]
    self.winner = nil
  end
end
