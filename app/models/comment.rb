class Comment < ActiveRecord::Base
	belongs_to :blog, counter_cache: :posts_count
	validates :content, presence: true

	belongs_to :author, class_name: "User", foreign_key: :user_id

	def editable_by?(user)
	  user && user == author
	end
end
