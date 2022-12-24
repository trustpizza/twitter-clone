class Comment < ApplicationRecord
  belongs_to :tweet
  belongs_to :commenter, class_name: "User"

  validates :body, presence: true, length: { in: 1..140 }
end
