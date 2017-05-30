class Photopost < ApplicationRecord
	validates :image, presence: true

	has_attached_file :image, styles: { 
		:thumb => "100x100#",
		:small => "200x200#",
		:medium => "640x640#" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	
end

