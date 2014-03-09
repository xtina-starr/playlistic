class PlaylistController < ApplicationController


  # def playlist
  #   @playlist = Playlist.new("by_artist" params[:artist])
  # end

  def player
    @playlist = Playlist.new(params[:type], params[:search])

    @tracks = @playlist.songs.map do |track| 
     track.spotify_id
    end
    @tracks = @tracks.join(",")

    render "welcome/index"
  end

end