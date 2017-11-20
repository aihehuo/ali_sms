# AliSms

阿里云短信Ruby SDK，主要功能发送短信，查询剩余短信及短信发送状态

## Installation

```ruby
gem 'ali_sms'
```

## Usage

```ruby
# initializer/ali_sms.rb
AliSms.configure do |config|
  access_key_id = 'YOUR_KEY'
  access_secret = 'YOUR SECRET'
  format = 'JSON' # 默认JSON，支持XML
  signature_version = '1.0' # 随便填
  version = '2017-11-20' # API版本,随便填
  region_id = 'cn-hangzhou'
  sign_name = '爱合伙' # 默认短信头, 可以在发送时自定义
  host = 'http://dysmsapi.aliyuncs.com' # 不建议修改
end
```
#### 发送短信接口
```ruby
AliSms.send('phone_number', 'template_code', 'template_param', 'sign_name')
# template_param及sign_name选填, template_param必须为json格式，如：{"customer": "test"}.to_json
```
## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AliSms project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/ali_sms/blob/master/CODE_OF_CONDUCT.md).
