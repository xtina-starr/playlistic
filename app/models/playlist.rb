class Playlist
  attr_accessor :type, :search, :songs

  def initialize(type, search)
    @type = type 
    @search = search
    self.get_playlist
  end

  def get_playlist
    if @type == "by_artist"
      self.get_playlist_by_similar_artist
    else 
      self.get_playlist_by_genre
   end
  end

  def get_playlist_by_similar_artist
    creates_playlist(artist_search)
  end

  def get_playlist_by_genre
    creates_playlist(search_by_bpm)
  end

  def creates_playlist(response)
      array_of_songs = response["response"]["songs"].map { |song| 
        if song["tracks"].length > 0 
          Song.new(song) 
        end
      }

      @songs = array_of_songs.compact
      self
  end

  def artist_search
    HTTParty.get("http://developer.echonest.com/api/v4/playlist/static?api_key=#{ENV["ECHO_API_KEY"]}&artist=#{@search}&format=json&results=10&type=artist-radio&bucket=id:spotify-WW&bucket=tracks").parsed_response
  end

  def search_by_bpm
    HTTParty.get("http://developer.echonest.com/api/v4/playlist/static?api_key=#{ENV["ECHO_API_KEY"]}&style=#{@search}&min_tempo=140&max_tempo=160&type=artist-description&bucket=id:spotify-WW&bucket=tracks").parsed_response
  end

end