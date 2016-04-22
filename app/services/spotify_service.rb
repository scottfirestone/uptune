class SpotifyService
  require "base64"

  def initialize
    #validate/refresh user's token
    @_apikey = ENV["SPOTIFY_CLIENT_ID"]
    @_secret = ENV["SPOTIFY_CLIENT_SECRET"]
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
