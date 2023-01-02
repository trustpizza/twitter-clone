class Tweet < ApplicationRecord
  validates :body, presence: true, 
                  length: { maximum: 240 },
                  allow_nil: false


  belongs_to :author, class_name: "User"
  
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  scope :ordered, -> {order(id: :desc)}


  def liked_by?(user)
    likes.any? { |like| like.user == user }
  end

  def find_like(user)
    likes.find_by(user: user)
  end
end
