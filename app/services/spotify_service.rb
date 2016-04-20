class SpotifyService
  require "base64"

  def initialize
    @_apikey = ENV["SPOTIFY_CLIENT_ID"]
    @_secret = ENV["SPOTIFY_CLIENT_SECRET"]
  end

  def request_new_token(user)
  hash = { grant_type: "refresh_token", refresh_token: user.refresh_token}
  encoded_auth = Base64.strict_encode64("#{@_apikey}:#{@_secret}")
  response = Faraday.new("https://accounts.spotify.com/api/token").post do |req|
    req.headers['Authorization'] = "Basic #{encoded_auth}"
    req.body = hash
  end
  parse(response)
  end

  private
    def apikey
      @_apikey
    end

    def connection
      @_connection
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
