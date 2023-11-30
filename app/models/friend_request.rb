class FriendRequest < ApplicationRecord
  belongs_to :user

  def self.reacted?(id1, id2)
    case1 = !FriendRequest.where(user_id: id1, friend_id: id2).empty?
    case2 = !FriendRequest.where(user_id: id2, friend_id: id1).empty?
    case1 || case2
  end

  def self.confirmed_record?(id1, id2)
    case1 = !FriendRequest.where(user_id: id1, friend_id: id2, confirmed: true).empty?
    case2 = !FriendRequest.where(user_id: id2, friend_id: id1, confirmed: true).empty?
    case1 || case2
  end

  def self.find_friend_request(id1, id2)
    if FriendRequest.where(user_id: id1, friend_id: id2, confirmed: true).empty?
      FriendRequest.where(user_id: id2, friend_id: id1, confirmed: true)[0].id
    else
      FriendRequest.where(user_id: id1, friend_id: id2, confirmed: true)[0].id
    end
  end
end
