class AdminMailer < ApplicationMailer
  def user_info(admin, user)
    @user = user
    @admin = admin

    attachments['user_info.pdf'] = UserInfo.new(@user).content
    mail(to: 'development@taskwunder.com', subject: "User info - #{@user.full_name}")
  end
end
