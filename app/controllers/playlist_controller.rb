class PlaylistController < ApplicationController

  def player
    if params[:artist].length > 0
      @playlist = Playlist.get_playlist_by_similar_artist(params[:artist])
    else 
      @playlist = Playlist.get_playlist_by_genre("80s")
   end


    @tracks = @playlist.songs.map do |track| 
     track.spotify_id
    end
    @tracks = @tracks.join(",")

    render "welcome/index"
  end

end