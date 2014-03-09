class PlaylistController < ApplicationController


  # def playlist
  #   @playlist = Playlist.new("by_artist" params[:artist])
  # end

  def player
    if params[:artist].present?
      @playlist = Playlist.new("by_artist", params[:artist]).get_playlist_by_similar_artist
    else 
      @playlist = Playlist.new("by_genre", params[:genre])
   end


    @tracks = @playlist.songs.map do |track| 
     track.spotify_id
    end
    @tracks = @tracks.join(",")

    render "welcome/index"
  end

end