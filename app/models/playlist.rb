class Playlist < ActiveRecord::Base
  include CodeGenerator

  belongs_to :user
  validates_uniqueness_of :code

  def self.from_raw_playlist(raw_playlist, user)
    create do |new_playlist|
      new_playlist.name        = raw_playlist[:name]
      new_playlist.playlist_id = raw_playlist[:id]
      new_playlist.uri         = raw_playlist[:uri]
      new_playlist.href        = raw_playlist[:owner][:href]
      new_playlist.tracks      = raw_playlist[:tracks][:items]
      new_playlist.snapshot_id = raw_playlist[:snapshot_id]
      new_playlist.user_id     = user.id
    end
  end

  def generate_code
    while self.code.nil? do
      code = CodeGenerator.generate_code
      break if update(code: code)
    end
  end

  def to_param
    code
  end
end