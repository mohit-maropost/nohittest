class InvitesController < ApplicationController
	before_action :authenticate_user!, :except => [:token_url]

	def new
		@invite =  Invite.new
		@account = Account.where(owner_id: current_user.id).first
	end


	def create
	  @invite = Invite.new(invite_params)
	  if @invite.save
	    #if the user already exists
	    if @invite.user_id != nil 
	       InviteMailer.existing_user_invite(@invite, new_user_registration_path).deliver 
	    else
	       InviteMailer.new_user_invite(@invite, new_user_registration_path(:invite_token => @invite.token)).deliver
	    end
	  else
	     redirect_to(new_invite_path)
	  end
	  redirect_to root_path 
	end

	def token_url
	end

	private

	def invite_params
		# params.require(:invite).permit(:account_id, :user_id, :name, :token)
		params.require(:invite).permit!

	end
end
