# Preview all emails at http://localhost:3000/rails/mailers/admin
class AdminPreview < ActionMailer::Preview
  def user_info
    admin = User.first
    user = User.last
    AdminMailer.user_info(admin, user)
  end
end
