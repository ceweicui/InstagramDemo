class Photopost < ApplicationRecord
	validates :image, presence: true
	validates :user_id, presence: true  

	has_attached_file :image, styles: { 
		:thumb => "100x100#",
		:small => "200x200#",
		:medium => "640x640#" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


	belongs_to :user  

	def current_user_posts(user)
		User.where("photoposts.user_id = ?", user.id)
	end

	def next
		user.photoposts.where("id > ?", id).first
	end

	def prev
		user.photoposts.where("id < ?", id).last
	end

end

