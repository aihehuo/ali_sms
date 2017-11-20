RSpec.describe AliSms::Utils do
  include AliSms::Utils

  it "encode successfully" do
    expect(special_url_encoding('阿里云短信测试专用')).to eq('%E9%98%BF%E9%87%8C%E4%BA%91%E7%9F%AD%E4%BF%A1%E6%B5%8B%E8%AF%95%E4%B8%93%E7%94%A8')
  end

  it "deals special characters" do
    expect(special_url_encoding(" *~")).to eq("%20%2A-")
  end
end
