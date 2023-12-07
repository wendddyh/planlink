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

  def friends
    friends_i_sent_request = FriendRequest.where(user_id: id, confirmed: true).pluck(:friend_id)
    friends_i_got_request = FriendRequest.where(friend_id: id, confirmed: true).pluck(:user_id)
    ids = friends_i_sent_request + friends_i_got_request
    User.where(id: ids)
  end

end
