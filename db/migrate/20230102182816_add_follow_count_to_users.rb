class AddFollowCountToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :follows_count, :integer, :null => false, :default => 0
  end
end
