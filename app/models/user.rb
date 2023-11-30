class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :events, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :venues, dependent: :destroy
  has_many :friend_requests, dependent: :destroy
  has_many :pending_friend_requests, -> { where confirmed: false}, class_name: 'FriendRequest', foreign_key: "friend_id"
  has_many :friend_requests, dependent: :destroy
  has_many :pending_friend_requests, -> { where confirmed: false}, class_name: 'FriendRequest', foreign_key: "friend_id"

  def friends
    friends_i_sent_friend_request = FriendRequest.where(user_id: id, confirmed: true).pluck(friend_id)
    friends_i_got_friend_request = FriendRequest.where(friend_id: id, confirmed: true).pluck(user_id)
    ids = friends_i_sent_friend_request + friends_i_got_friend_request
    User.where(id: ids)
  end

  def friend_with?(user)
    FriendRequest.confirmed_record?(id, user.id)
  end

  def send_friend_request(user)
    friend_requests.create(friend_id: user.id)
  end
end
