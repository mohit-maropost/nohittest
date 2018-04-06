class AccountsController < ApplicationController
	def show
	  @account = Account.find(params[:id])
	  @users_in_account = Invite.where(account_id: @account.id)
	  @users = Array.new
	      @users_in_account.each do |u|
	        user_id = u.user_id
	        u = User.find_by(id: user_id)
	        @users.push(u)
	        end
	      @users
	      @teams = Team.where(account_id: @account.id) 
	end
	 

	private
	   def valid_params
	     params.require(:account).permit(:name, :owner_id)
	   end

end
