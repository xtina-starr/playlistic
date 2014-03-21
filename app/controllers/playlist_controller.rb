class PlaylistController < ApplicationController

  def player
    search_string = (params[:artist])
    uri = URI::encode(search_string)
    @playlist = Playlist.get_playlist_by_similar_artist(uri)


    @tracks = @playlist.songs.map do |track| 
     track.spotify_id
    end
    @tracks = @tracks.join(",")

    render "welcome/index"
  end

end