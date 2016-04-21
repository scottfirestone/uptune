class PlaylistCreator
  def initialize(user)
    code         = CodeGenerator.generate_code
    user         = user
    name         = Time.now.strftime('%Y%m%d')
    raw_playlist = SpotifyUserService.new(user).create_playlist(name)
  end
end
