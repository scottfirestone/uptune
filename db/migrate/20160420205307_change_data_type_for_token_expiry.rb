class ChangeDataTypeForTokenExpiry < ActiveRecord::Migration
  def up
    remove_column :users, :token_expiry
    add_column :users, :token_expiry, :datetime
  end

  def down
    remove_column :users, :token_expiry
    add_column :users, :token_expiry, :string
  end
end
