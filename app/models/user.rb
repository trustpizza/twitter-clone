class User < ApplicationRecord
  include Gravtastic
  gravtastic 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable  

  devise :omniauthable, omniauth_providers: %i[facebook]

  validates :name, presence: true

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

  def self.from_omniauth(auth)
    name_split = auth.info.name.split(" ")
    user = User.where(email: auth.info.email).first
    user ||= User.create!(provider: auth.provider, uid: auth.uid, last_name: name_split[0], first_name: name_split[1], email: auth.info.email, password: Devise.friendly_token[0, 20])
      user
  end


  # Scopes

  scope :popular, -> { order(follows_count: :desc).take(5) }

  # Followers have a receiver id that matches up to a Users Id
  # Order by the number of receiver id's that match to a Users Id
  # Show the user with the most matches
end
