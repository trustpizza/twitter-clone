class AddFollowersCountToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :follows_count, :integer
  end
end
