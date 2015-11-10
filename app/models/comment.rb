class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
	has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100#" }
	# can also add after hash:
	# , default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	validates :body, presence: true, unless: ->(comment){comment.image.present?}

	validates :image, presence: true, unless: ->(comment){comment.body.present?}
end
