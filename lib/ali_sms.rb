require "ali_sms/version"

module AliSms
  class << self
    attr_accessor :configuration

    def configure
      configuration ||= Configuration.new
      yield(configuration) if block_given?
    end
  end

  configure
end
