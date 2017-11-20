require "ali_sms/version"
require "ali_sms/configuration"

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
