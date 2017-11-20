module AliSms
  class SendSms
    def initialize(phone_number, template_code, template_param, sign_name)
      @phone_number = phone_number
      @template_code = template_code
      @template_param = template_param
      @sign_name = sign_name
    end

    def excute
      puts url
      begin
        RestClient.get(url)
      rescue RestClient::ExceptionWithResponse => err
        err.response
      end
    end

    private

    attr_reader :phone_number, :template_code, :template_param, :sign_name

    def url
      @url ||= "#{AliSms.configuration.host}?Signature=#{sign}&#{encoded_string}"
    end

    def sign
      @sign ||= Sign.new(string_to_sign).call
    end

    def string_to_sign
      @string_to_sign ||= params_instance.string_to_sign
    end

    def encoded_string
      @encoded_string ||= params_instance.encoded_string
    end

    def params_instance
      @params_instance ||= Params.new('SendSms', phone_number, sign_name, template_code, template_param)
    end
  end
end
