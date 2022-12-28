class RenameUserIdToSenderId < ActiveRecord::Migration[7.0]
  def change
      add_reference :follows, :sender_id, foreign_key: { to_table: :users }
  end
end
