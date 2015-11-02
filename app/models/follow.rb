class Follow < ActiveRecord::Base
	belongs_to :user, foreign_key: :followee_id
end
