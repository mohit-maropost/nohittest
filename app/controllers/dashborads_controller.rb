class DashboradsController < ApplicationController
	def index
		check_for_account = Account.find_by(owner_id: current_user.id)
		if check_for_account == nil
			@accounts = Array.new
			@invitations = Invite.where(owner_id: current_user.id)
			@invitations.each do |invite|
				acc_id = invite.accounts_id
				account = Account.find_by(id: acc_id)
				@accounts.push(account)
			end
		else
			@accounts = Account.where(owner_id: current_user.id)
		end
	end
end
