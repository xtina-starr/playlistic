require 'spec_helper'

describe Song do
  describe "#spotify_id" do

    it "cleans foreign_id" do
      hash = {"tracks" => [{ "foreign_id" => "spotify-WW:track:2L1EeGF29LyA7EFMdQEak1" }]}
      song = Song.new(hash)
      expect(song.spotify_id).to eq("2L1EeGF29LyA7EFMdQEak1")
    end
  end
end