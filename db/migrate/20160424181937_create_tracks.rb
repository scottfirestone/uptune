class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :artist
      t.string :title
      t.string :uri

      t.timestamps null: false
    end
  end
end
