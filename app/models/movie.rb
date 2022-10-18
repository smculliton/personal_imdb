class Movie < ApplicationRecord
  belongs_to :director

  def self.oscar_winners
    where(oscar_winner: true)
  end
end