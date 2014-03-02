class Song 
  attr_accessor :artist_name, :title, :foreign_id

  def initialize(hash)
    self.artist_name = hash["artist_name"]
    self.foreign_id = hash["tracks"].first["foreign_id"]
    # self.title = hash["title"]

    puts foreign_id
  end

  def spotify_id
    self.foreign_id.sub("spotify-WW:track:", "")
  end



end