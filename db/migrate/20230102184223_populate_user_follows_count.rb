class PopulateUserFollowsCount < ActiveRecord::Migration[7.0]
  def up
    User.find_each do |user|
      User.reset_counters(user.id, :followers)
    end
  end
end
