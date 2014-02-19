class Playlist <ActiveRecord::Base

  def self.get_playlist_by_similar_artist(artist)
    # http://developer.echonest.com/api/v4/playlist/static?api_key=FILDTEOIK2HBORODV&artist=Weezer&type=artist-radio&results=5
    response = HTTParty.get("http://developer.echonest.com/api/v4/playlist/static?api_key=#{ENV["ECHO_API_KEY"]}&artist=#{artist}&format=json&results=10&type=artist-radio")
    pp response.parsed_response["response"]["songs"].map { |song| song["title"] }
  end

end