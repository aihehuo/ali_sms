require "ali_sms/version"
require "ali_sms/configuration"
require "ali_sms/utils"
require "ali_sms/sign"
require "ali_sms/params"

require 'json'
require 'time'
require 'securerandom'
require 'openssl'
require 'base64'

module AliSms
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration) if block_given?
    end
  end

  configure
end
