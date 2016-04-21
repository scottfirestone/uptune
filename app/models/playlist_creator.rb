class PlaylistCreator
  def initialize(user)
    code         = CodeGenerator.generate_code
    user         = user
    name         = Time.now.strftime('%Y%m%d')
    raw_playlist = SpotifyService.new.create_playlist(user, name)
  end
end
