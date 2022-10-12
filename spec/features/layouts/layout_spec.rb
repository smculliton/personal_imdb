require 'rails_helper'

RSpec.describe 'website header' do 
  it 'contains movie index link' do
    visit '/directors/'
    click_on 'Director Index'
    expect(current_path).to eq('/directors/')

    visit '/movies/'
    click_on 'Director Index'
    expect(current_path).to eq('/directors/')
  end

  it 'contains movies index link' do
    visit '/directors/'
    click_on 'Movie Index'
    expect(current_path).to eq('/movies/')

    visit '/movies/'
    click_on 'Movie Index'
    expect(current_path).to eq('/movies/')
  end
end