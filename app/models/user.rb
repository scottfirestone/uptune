class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid = auth_info.uid
      new_user.image = auth_info["info"]["image"]
      new_user.token = auth_info["credentials"]["token"]
      new_user.refresh_token = auth_info["credentials"]["refresh_token"]
      new_user.token_expiry = Time.at(auth_info["credentials"]["expires_at"].to_i)
    end
  end

  def validate_auth_token
    if Time.now > token_expiry
      new_token = SpotifyService.new.request_new_token(self)[:access_token]
      new_expiry = token_expiry + 60.minutes
      update_attributes(token: new_token, token_expiry: new_expiry)
    end
  end
end
