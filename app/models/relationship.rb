class Relationship < ApplicationRecord
	belongs_to :follower_id, claas_name:"User"
	belongs_to :followed_id, claas_name:"User"

	validates :follower_id, presence: true
	validates :followed_id, presence: true
end
