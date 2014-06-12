class PlaylistController < ApplicationController

  def create
    search_term = (params[:artist])
    uri = URI::encode(search_term)
    @playlist = Playlist.get_playlist_by_similar_artist(uri)



    @tracks = @playlist.songs.map do |track| 
     track.spotify_id
    end
    @tracks = @tracks.join(",")

    render "welcome/index"
  end

end