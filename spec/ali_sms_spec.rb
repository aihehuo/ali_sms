RSpec.describe AliSms do
  it "has a version number" do
    expect(AliSms::VERSION).not_to be nil
  end

  describe '#send' do
    it 'raise error if not sccess_key or id configured' do
      AliSms.configure do |config|
        config.access_secret = nil
        config.access_key_id = nil
      end
      expect { AliSms.send('13589898888', 'TEST_CODE') }.to raise_error('access_key或access_key_id未设置!')
    end

    it 'raise error on wrong phone_number or wrong param' do
      AliSms.configure do |config|
        config.access_secret = 'test_secret'
        config.access_key_id = 'test_key'
      end
      expect { AliSms.send('1358989888', 'TEST_CODE') }.to raise_error('手机号码格式有误！')
      expect { AliSms.send('13589898888', 'TEST_CODE', 'wrong_json') }.to raise_error('参数格式应为json')
    end
  end
end
