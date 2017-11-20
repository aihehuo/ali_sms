require 'erb'
include ERB::Util

module AliSms
  module Utils
    # 在一般的URLEncode后再增加三种字符替换：加号（+）替换成 %20、星号（*）替换成 %2A、%7E 替换回波浪号（~）
    def special_url_encoding(string)
      url_encode(string).gsub('+', '%20').gsub('*', '%2A').gsub('%7E', '-')
    end
  end
end
