class AddPasswordSentAtAndPasswordTokenToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :reset_password_sent_at, :datetime
    add_column :users, :reset_password_token, :string

    add_index :users, :reset_password_token, unique: true
  end
end
