class ChangeUserIdToAuthorIdOnTweets < ActiveRecord::Migration[7.0]
  def change
    rename_column(:tweets, :user_id, :author_id)
  end
end
