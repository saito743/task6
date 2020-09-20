class BookComment < ApplicationRecord
	belongs_to :user
	belongs_to :book

	validates :comment, precence: true
end
