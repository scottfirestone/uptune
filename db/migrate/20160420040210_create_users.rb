class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :image
      t.string :token
      t.string :refresh_token
      t.string :token_expiry

      t.timestamps null: false
    end
  end
end
