
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ali_sms/version"

Gem::Specification.new do |spec|
  spec.name          = "ali_sms"
  spec.version       = AliSms::VERSION
  spec.authors       = ["Bran Liang"]
  spec.email         = ["lby89757@hotmail.com"]

  spec.summary       = %q{阿里云短信ruby SDK.}
  spec.description   = %q{功能包括发送短信，查询短信发送状况，查询剩余短信数量。}
  spec.homepage      = "http://www.liangboyuan.pub"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
