require 'spec_helper'

describe Playlist do 

  describe " .get_playlist_by_similar_artist" do
    before do
      Playlist.stub(:artist_search).with("Beatles") { spotify_response }
    end
    it "returns an array" do
      expect(Playlist.get_playlist_by_similar_artist("Beatles")).to be_an_instance_of(Playlist)
    end

    it "first element is a song object" do
      expect(Playlist.get_playlist_by_similar_artist("Beatles").songs.first).to be_an_instance_of(Song)
    end

    it "assigns the artist to Beatles" do
      playlist = Playlist.get_playlist_by_similar_artist("Beatles")
      expect(playlist.artist).to eq("Beatles")
    end
  end
end