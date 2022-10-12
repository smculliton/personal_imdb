class Movie < ApplicationRecord
  belongs_to :director

  def oscar_winner?
    oscar_winner
  end

  def self.rotten_tomatoes(score)
    return 0 if score == nil 
    score
  end
end