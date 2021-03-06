class User < ApplicationRecord
  has_many :user_games
  has_many :games, :through => :user_games

  validates_uniqueness_of :name


  def self.dealer
    User.find_by_name("dealer")
  end

  def hand( game)
    h = user_games.where( :game_id => game.id)
    h.empty? ? nil : h.first
  end

  def hit_me(game)
    hand(game).cards << Card.hit
  end

  def wins
    self.games.find_all { |g| g.winner == self }.count
  end

  def losses
    self.games.find_all { |g| g.winner != self }.count
  end

  def ties
  end

  def dealer_strategy( game)
    self.hand(game).value < 17
  end
end
