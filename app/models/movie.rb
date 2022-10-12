class Movie < ApplicationRecord
  belongs_to :director

  def oscar_winner?
    self.oscar_winner
  end
end