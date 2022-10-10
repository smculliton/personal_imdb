require 'rails_helper'

RSpec.describe Director do
  before(:each) do 
    @kubrick = Director.create!
  end

  it {should have_many :movies}
end