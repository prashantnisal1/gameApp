class UserGame < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many   :cards

  after_create do
    cards << Card.hit
    cards << Card.hit
  end

  def value # value of the hand
    card_rank = cards.find_all { |c| c.rank}
    retval = card_rank.reduce(0) { |m,c| m + c.value }
  end
end
