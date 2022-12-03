require 'rails_helper'

RSpec.describe 'the songs show page' do
  it 'displays the song title' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I really like you", length: 234232, play_count: 5312134)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 67542, play_count: 987431)
    #require 'pry'; binding.pry
    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song_2.title)
  end

  it 'displays the name of artist for the song' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I really like you", length: 234232, play_count: 5312134)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 67542, play_count: 987431)

    visit "/songs/#{song.id}"

    expect(page).to have_content(artist.name)
  end
end