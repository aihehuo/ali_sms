module AliSms
  class Configuration
    attr_reader :signature_method
    attr_accessor :access_key_id, :access_secret, :format, :signature_version, :version, :region_id, :sign_name, :host

    def initialize
      @format = 'JSON'
      @signature_method = 'HMAC-SHA1'
      @signature_version = '1.0'
      @version = '2017-05-25'
      @region_id = 'cn-hangzhou'
      @sign_name = '爱合伙'
      @host = 'http://dysmsapi.aliyuncs.com'
    end
  end
end
