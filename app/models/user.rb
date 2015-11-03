class User < ActiveRecord::Base
	has_many :posts
  has_many :follows, foreign_key: :follower_id
  validates_presence_of :username, :password, :email
  validates :password, confirmation: true
  validates :username, uniqueness: true
	has_attached_file :avatar, styles: { large: "600x600>", medium: "300x300>", thumb: "50x50#" }
	# can also add after hash:
	# , default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	def full_name
		if !fname.empty? && !lname.empty?
			fname+" "+lname
		elsif !fname.empty?
			fname.capitalize
		elsif !lname.empty?
			lname.capitalize
    elsif fname.empty? && lname.empty?
      username
		end
  end

  # returns true or false
  def following?(other_user)
    followers = follows.collect {|f| f.followee_id}
    followers.include?(other_user.id)
  end

end
