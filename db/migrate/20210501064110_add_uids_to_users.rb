class AddUidsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :uid_twitter, :integer
    add_column :users, :uid_facebook, :integer
    add_column :users, :uid_google_oauth2, :integer
  end
end
