class InviteMailer < ApplicationMailer
	def new_user_invite(user, url)
    @user = user
    @url = url
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def existing_user_invite(user, url)
    @user = user
    @url = url
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
