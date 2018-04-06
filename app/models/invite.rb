class Invite < ActiveRecord::Base
	before_create :generate_token
	before_save :check_user_existence

	def check_user_existence
		user = User.find_by_email(email)
		if user
		  self.user_id = user.id
		end
	end

	def generate_token
	   self.token = Digest::SHA1.hexdigest([self.accounts_id, Time.now, rand].join)
	end
end