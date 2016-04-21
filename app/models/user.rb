class User < ActiveRecord::Base
  has_many :playlists

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid = auth_info.uid
      new_user.image = auth_info["info"]["image"]
      new_user.token = auth_info["credentials"]["token"]
      new_user.refresh_token = auth_info["credentials"]["refresh_token"]
      new_user.token_expiry = Time.at(auth_info["credentials"]["expires_at"].to_i)
    end
  end

  def update_token(new_token)
    new_expiry = Time.now + 60.minutes
    update_attributes(token: new_token, token_expiry: new_expiry)
  end

  def token_expired?
    Time.now > token_expiry
  end
end
