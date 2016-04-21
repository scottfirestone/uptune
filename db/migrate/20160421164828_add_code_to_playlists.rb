class AddCodeToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :code, :string
  end
end
