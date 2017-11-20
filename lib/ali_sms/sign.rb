module AliSms
  class Sign
    include Utils
    attr_reader :string_to_sign

    def initialize(string_to_sign)
      @string_to_sign = string_to_sign
    end

    def call
      sign(AliSms.configuration.access_secret, string_to_sign)
    end

    private

    def sign(access_secret, string_to_sign)
      key = access_secret + '&'
      digest = OpenSSL::Digest.new('sha1')
      sign = Base64.encode64(OpenSSL::HMAC.digest(digest, key, string_to_sign))
      special_url_encoding(sign.chomp) # 通过chomp去掉最后的换行符 LF
    end
  end
end
