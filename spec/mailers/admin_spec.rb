require "rails_helper"

RSpec.describe AdminMailer, type: :mailer do
  describe '#user_info' do
    let(:admin) { FactoryGirl.create(:user, admin: true) }
    let(:user) { FactoryGirl.create(:user) }

    let(:mail) { AdminMailer.user_info(admin, user) }
    it 'renders' do
      expect(mail.subject).to eq "User info - #{user.full_name}"
      expect(mail.to).to eq ['development@taskwunder.com']
      expect(mail.from).to eq ['support@letter.com']
      ActionMailer::Base.deliveries = []
      expect{ mail.deliver_now }.to change{ ActionMailer::Base.deliveries.count }.from(0).to(1)
    end
  end
end
