class User < ActiveRecord::Base
	  attr_accessor :account_name, :invite_token

 	# has_one :account, dependent: :destroy, autosave: true
 	# accepts_nested_attributes_for :account
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  after_create :generate_user_or_invite_user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def generate_user_or_invite_user
  	
    Account.create(name: account_name, owner_id: self.id) if account_name

	  if invite_token != nil
	     org =  Invite.find_by_token(invite_token) #find the user group attached to the invite
	     org.update_atributes(user_id: self.id) if org
	  end
	end

end
