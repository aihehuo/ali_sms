module AliSms
  class Configuration
    attr_reader :signature_method
    attr_accessor :access_key_id, :access_secret, :format, :signature_version, :version, :region_id

    def initialize
      @format = 'JSON'
      @signature_method = 'HMAC-SHA1'
      @signature_version = '1.0'
      @version = '2017-11-20'
      @region_id = 'cn-hangzhou'
    end
  end
end
