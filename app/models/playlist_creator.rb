class PlaylistCreator
  def self.create_playlist(user)
    name         = Time.now.strftime('%Y%m%d')
    raw_playlist = SpotifyUserService.new(user).create_playlist(name)
    Playlist.from_raw_playlist(raw_playlist, user).tap do |playlist|
      playlist.generate_code
    end
  end
end
