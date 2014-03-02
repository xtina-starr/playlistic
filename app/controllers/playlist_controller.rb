class PlaylistController < ApplicationController

  def player
    @playlist = Playlist.get_playlist_by_similar_artist(params[:artist])


    @tracks = @playlist.songs.map do |track| 
     track.spotify_id
    end
    @tracks = @tracks.join(",")

    render "welcome/index"
  end

end