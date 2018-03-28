class DashboradsController < ApplicationController
  def index
  	@owner= Account.where(owner_id:  current_user.id).first
  	@account_member =  Invite.where(account_id: @owner.id)
   	# owner_present = Account.where(owner_id: current_user.id).first
  	# account_present = Invite.where(user_id: current_user.id).first
  	# @owner = owner_present ? owner_present : Account.where(user)
  end
end
