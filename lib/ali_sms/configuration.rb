module AliSms
  class Configuration
    attr_accessor :access_key_id, :format, :signature_method, :signature_version, :version, :region_id

    def initialize
      @format = 'JSON'
      @signature_method = 'HMAC-SHA1'
      @signature_version = '1.0'
      @version = '1.0'
      @region_id = 'cn-hangzhou'
    end
  end
end
