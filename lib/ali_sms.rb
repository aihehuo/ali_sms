require 'json'
require 'time'
require 'securerandom'
require 'openssl'
require 'base64'
require 'rest-client'

require "ali_sms/version"
require "ali_sms/configuration"
require "ali_sms/utils"
require "ali_sms/params"
require "ali_sms/sign"
require "ali_sms/send_sms"


module AliSms
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration) if block_given?
    end

    # @template_param => JSON, optional
    def send(phone_number, template_code, template_param = {}.to_json, sign_name = configuration.sign_name)
      check_configuration!
      check_phone!(phone_number)
      check_template_params!(template_param)
      SendSms.new(phone_number, template_code, template_param, sign_name).excute
    end

    private

    def check_configuration!
      raise 'access_key或access_key_id未设置!' unless configuration.access_secret && configuration.access_key_id
    end

    def check_phone!(phone_number)
      raise '手机号码格式有误！' unless phone_number && phone_number.to_s.match(/^\d{11}$/)
    end

    def check_template_params!(params)
      begin
        JSON.parse(params)
      rescue
        raise '参数格式应为json'
      end
    end
  end

  configure
end
