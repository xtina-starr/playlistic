class PlaylistController < ApplicationController


  # def playlist
  #   @playlist = Playlist.new("by_artist" params[:artist])
  # end

  def player
    @playlist = Playlist.new(params[:type], params[:search])
    render "welcome/index"
  end

end