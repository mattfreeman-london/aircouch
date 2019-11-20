'require Email'

describe  "sending an email" do
  # include Mail::Matchers

  before(:each) do
    Mail::TestMailer.deliveries.clear

    Mail.deliver do
      to ['mikel@me.com', 'mike2@me.com']
      from 'you@you.com'
      subject 'testing'
      body 'hello'
    end
  end

  it { is_expected.to have_sent_email.from('you@you.com') }
  it { is_expected.to have_sent_email.to('mike1@me.com') }

end
