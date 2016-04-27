class SpotifyUserService
  require "base64"

  def initialize(user)
    @_apikey     = ENV["SPOTIFY_CLIENT_ID"]
    @_secret     = ENV["SPOTIFY_CLIENT_SECRET"]
    @_connection = Faraday.new("https://api.spotify.com/")
    @_user       = user
    validate_auth_token(user)
  end

  def request_new_token
    hash = { grant_type: "refresh_token", refresh_token: user.refresh_token}
    encoded_auth = Base64.strict_encode64("#{@_apikey}:#{@_secret}")
    response = Faraday.new("https://accounts.spotify.com/api/token").post do |req|
      req.headers["Authorization"] = "Basic #{encoded_auth}"
      req.body = hash
    end
    new_token = parse(response)[:access_token]
    user.update_token(new_token)
  end

  def create_playlist(name)
    req_body = { name: "#{name}" }.to_json
    response = connection.post do |req|
      req.headers['Authorization'] = "Bearer #{user.token}"
      req.url "v1/users/#{user.uid}/playlists"
      req.body = req_body
    end
    parse(response)
  end

  def update_user_playlist(playlist)
    req_body = { uris: playlist.track_uris }.to_json
    response = connection.post do |req|
      req.headers['Authorization'] = "Bearer #{user.token}"
      req.url "v1/users/#{user.uid}/playlists/#{playlist.playlist_id}/tracks"
      req.body = req_body
    end
    a = parse(response)
    binding.pry
  end

  private

    def user
      @_user
    end

    def apikey
      @_apikey
    end

    def connection
      @_connection
    end

    def validate_auth_token(user)
      request_new_token if user.token_expired? || user.token.nil?
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
    #
    # def headers
    #   ['Authorization'] = "Bearer #{user.token}"
    # end
end
