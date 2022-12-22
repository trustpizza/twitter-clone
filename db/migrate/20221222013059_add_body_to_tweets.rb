class AddBodyToTweets < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :body, :text
  end
end
