class Round < ActiveRecord::Base
  has_one :deck
  has_many :guesses
end
