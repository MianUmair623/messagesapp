class Room < ApplicationRecord
	has_many :messages
	has_many :users, through: :messages
	validates :name, presence: {message: "Room Name must exist"}
end
