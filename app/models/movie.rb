class Movie < ApplicationRecord
  belongs_to :director

  def oscar_winner?
    oscar_winner
  end
end