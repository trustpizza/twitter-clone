class User < ApplicationRecord
  include Gravtastic
  gravtastic 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

  has_many :tweets, foreign_key: "author_id", class_name: "Tweet", dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :followers, foreign_key: "receiver_id", 
            class_name: "Follow", 
            dependent: :destroy
  has_many :followed, foreign_key: "sender_id", 
            class_name: "Follow", 
            dependent: :destroy

  has_one :profile, dependent: :destroy

  def can_follow?(receiver)
    if self.followed.any? { |follow| follow.receiver_id == receiver.id }
      false
    else 
      true
    end
  end


  # Scopes

  scope :popular, -> { order(follows_count: :desc).take(5) }

  # Followers have a receiver id that matches up to a Users Id
  # Order by the number of receiver id's that match to a Users Id
  # Show the user with the most matches
end
