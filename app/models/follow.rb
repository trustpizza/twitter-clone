class Follow < ApplicationRecord
  belongs_to :sender_id, class_name: 'User'
  belongs_to :receiver_id, class_name: 'User'
end
