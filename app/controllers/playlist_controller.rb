class PlaylistController < ApplicationController

  def player
    @songs = Playlist.get_playlist_by_similar_artist(params[:artist])
    @tracks = @songs.map do |track| 
     track.foreign_id.sub(/spotify-WW:track:/, "") 
    end
    @tracks = @tracks.join(",")

    render "welcome/index"
  end

end