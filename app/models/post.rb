class Post < ActiveRecord::Base
	validates 	:text, presence: true, length: { maximum: 300 }
	belongs_to :user
	has_many :comments
end
