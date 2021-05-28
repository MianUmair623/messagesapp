class UserMailer < ApplicationMailer
 default from: 'notifications@example.com'

 def welcome_email
    user = params[:user].uniq
    @user = user.map{|k| k.email}.join(',')
    @url  = 'http://example.com/login'
    mail(to: @user, subject: 'Welcome to My Awesome Site')
  end
end
