RSpec.describe AliSms::Params do
  before(:all) do
    AliSms.configure do |config|
      config.access_secret = 'testSecret'
      config.access_key_id = 'testId'
      config.format = 'XML'
      config.signature_version = '1.0'
      config.version = '2017-05-25'
      config.region_id = 'cn-hangzhou'
    end
  end

  it "return transformed params string" do
    p = AliSms::Params.new('SendSms', '15300000001', '阿里云短信测试专用', 'SMS_71390007',  {"customer": "test"}.to_json)
    p.timestamp = '2017-07-12T02:42:19Z'
    p.signature_nonce = '45e25e9b-0a6f-4070-8c85-2956eda1b466'

    expect(p.string_to_sign).to eq("GET&%2F&AccessKeyId%3DtestId%26Action%3DSendSms%26Format%3DXML%26PhoneNumbers%3D15300000001%26RegionId%3Dcn-hangzhou%26SignName%3D%25E9%2598%25BF%25E9%2587%258C%25E4%25BA%2591%25E7%259F%25AD%25E4%25BF%25A1%25E6%25B5%258B%25E8%25AF%2595%25E4%25B8%2593%25E7%2594%25A8%26SignatureMethod%3DHMAC-SHA1%26SignatureNonce%3D45e25e9b-0a6f-4070-8c85-2956eda1b466%26SignatureVersion%3D1.0%26TemplateCode%3DSMS_71390007%26TemplateParam%3D%257B%2522customer%2522%253A%2522test%2522%257D%26Timestamp%3D2017-07-12T02%253A42%253A19Z%26Version%3D2017-05-25")
  end
end
