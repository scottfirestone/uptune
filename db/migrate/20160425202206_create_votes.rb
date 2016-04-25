class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :playlist_track, index: true, foreign_key: true
      t.string :token

      t.timestamps null: false
    end
  end
end
