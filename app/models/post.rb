class Post < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100#" }
	# can also add after hash:
	# , default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	scope :followed, ->(follows) { where user_id: follows }
end
