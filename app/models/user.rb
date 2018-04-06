class User < ActiveRecord::Base
  
  attr_accessor :accounts_name, :invite_token
  after_create :generate_user_or_invite_user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  def generate_user_or_invite_user
    Account.create(name: accounts_name, owner_id: self.id) if accounts_name
	  if invite_token != nil
	     org =  Invite.find_by_token(invite_token)
	     org.update(user_id: self.id, token: "") if org
	  end
	end
end