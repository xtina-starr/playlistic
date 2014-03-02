class Playlist
  attr_accessor :songs, :artist

  def self.get_playlist_by_similar_artist(artist)
    # pp response.parsed_response["response"]["songs"].map { |song| song["title"] }

    # Song.new(response.parsed_response["response"]["songs"].last)

    array_of_songs = artist_search(artist)["response"]["songs"].map { |song| 
      if song["tracks"].length > 0 
        Song.new(song) 
      end
      }

      playlist = Playlist.new
      playlist.songs = array_of_songs.compact
      playlist.artist = artist
      playlist
    # could have also used array_of_songs.delete("nil") to remove nil elements
    # songs is an array
    # {:response => { :songs => [{:id => "1"}, {:id => 2}, {:id => 3}] } }
  end

  def self.artist_search(artist)
    HTTParty.get("http://developer.echonest.com/api/v4/playlist/static?api_key=#{ENV["ECHO_API_KEY"]}&artist=#{artist}&format=json&results=10&type=artist-radio&bucket=id:spotify-WW&bucket=tracks").parsed_response
  end

end