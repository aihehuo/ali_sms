module AliSms
  class Params
    include Utils
    attr_reader :action, :phone_number, :sign_name, :template_code, :template_param
    attr_accessor :signature_nonce, :timestamp

    def initialize(action, phone_number, sign_name, template_code, template_param = {}.to_json)
      @action = action
      @phone_number = phone_number
      @sign_name = sign_name
      @template_code = template_code
      @template_param = template_param
      @signature_nonce = SecureRandom.uuid
      @timestamp = Time.now.utc.iso8601
    end

    def string_to_sign
      "GET&#{special_url_encoding('/')}&#{special_url_encoding(encoded_string)}"
    end

    def encoded_string
      @encoded_string ||= [].tap do |collection|
        params.each do |k, v|
          collection << "#{special_url_encoding(k)}=#{special_url_encoding(v)}"
        end
      end.join('&')
    end

    private

    def params
      @params ||= {
        # 系统参数
        'SignatureMethod' => AliSms.configuration.signature_method,
        'SignatureNonce' => signature_nonce,
        'AccessKeyId' => AliSms.configuration.access_key_id,
        'SignatureVersion' => AliSms.configuration.signature_version,
        'Timestamp' => timestamp,
        'Format' => AliSms.configuration.format,
        # 业务API参数
        'Action' => action,
        'Version' => AliSms.configuration.version,
        'RegionId' => AliSms.configuration.region_id,
        'PhoneNumbers' => phone_number,
        'SignName' => sign_name,
        'TemplateParam' => template_param,
        'TemplateCode' => template_code
      }.sort.to_h
    end
  end
end
