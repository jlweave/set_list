require 'rails_helper'

RSpec.describe Artist do
  it {should have_many :songs}

  describe 'instance methods' do
    describe '#average_song_length' do
      before :each do
        @prince = Artist.create!(name: 'Prince')
        @purple = @prince.songs.create!(title: 'Purple Rain', length: 234215, play_count: 7322)
        @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 63452, play_count: 725342)
      end

      it 'returns the average song length' do
        expect(@prince.average_song_length).to eq(148833.5)
      end
    end
  end
end