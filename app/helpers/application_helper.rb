module ApplicationHelper
	def member_or_owner(user_id)
		check = Account.find_by(owner_id: user_id)
		check == nil ? "Member" : "Owner" 
	end
	
end