RSpec.describe AliSms::Configuration do
  it "has default values" do
    expect(AliSms.configuration.version).to eq('2017-11-20')
  end

  it "can be configured" do
    AliSms.configure do |config|
      config.version = '2.0'
    end
    expect(AliSms.configuration.version).to eq('2.0')
  end
end
