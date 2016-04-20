class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid = auth_info.uid
      new_user.image = auth_info["info"]["image"]
      new_user.token = auth_info["credentials"]["auth_token"]
      new_user.refresh_token = auth_info["credentials"]["refresh_token"]
      new_user.token_expiry = auth_info["credentials"]["expires_at"]
    end
  end

  def self.validate_auth_token
    if Time.now - 3.minutes > token_expiry
      new_token = SpotifyService.new.refresh_auth_token(self)
      update_attribute(:token, new_token)
    end
  end
end
