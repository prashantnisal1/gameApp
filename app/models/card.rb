class Card < ApplicationRecord
  belongs_to :user_game

  @@numbers = (2..10).to_a.map { |i| i.to_s } # value as per number
  @@royalty = [ "jack", "queen", "king" ] # value 10
  @@ranks = [ "ace" ] + @@numbers + @@royalty

  
  # return card name
  def self.ranks
    @@ranks
  end

  def self.values
    Hash[
      [[ "ace", 11 ]] + 
      @@numbers.map { |si| [ si, si.to_i ] } + 
      @@royalty.map { |royal| [ royal, 10 ] }
    ]
  end

  # return card value
  def value
    self.class.values[self.rank]
  end

  def self.hit
    self.create( :rank => self.ranks[ rand( 12)])
  end
end
