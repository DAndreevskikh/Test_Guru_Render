class Feedback < ApplicationRecord
	belongs_to :user
	validates :name, :email, :message, presence: true
end
