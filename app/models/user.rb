class User < ActiveRecord::Base
 	has_one :account, dependent: :destroy, autosave: true
 	accepts_nested_attributes_for :account
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
