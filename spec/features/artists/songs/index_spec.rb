#As a user
#When I visit an Artist's Songs Index
#Then i see the titles all of that Artist's Songs
#And I see that each title is a link to the Songs show page

require 'rails_helper'

RSpec.describe 'Artists songs index' do
  before :each do
    @prince = Artist.create!(name: 'Prince')
    @purple = @prince.songs.create!(title: 'Purple Rain', length: 234215, play_count: 7322)
    @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 63452, play_count: 725342)
  end

  it 'shows all of thetitles of the songs for the artist' do
    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content(@purple.title)
    expect(page).to have_content(@beret.title)
  end

  it 'links to each songs show page' do
    visit "/artists/#{@prince.id}/songs"

    click_on @purple.title

    expect(current_path).to eq("/songs/#{@purple.id}")
  end

  it 'shows the average song length for the artist' do
    visit "/artists/#{@prince.id}/songs"
    
    expect(page).to have_content("Average Song Length for Prince: 148833.5")
  end
end