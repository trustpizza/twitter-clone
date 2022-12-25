class Comment < ApplicationRecord
  belongs_to :tweet
  belongs_to :commenter, class_name: "User"

  scope :ordered, -> {order(id: :desc)}

  validates :body, presence: true, length: { in: 1..140 }
end
