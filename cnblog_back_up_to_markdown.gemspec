# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cnblog_back_up_to_markdown/version'

Gem::Specification.new do |spec|
  spec.name          = "cnblog_back_up_to_markdown"
  spec.version       = CnblogBackUpToMarkdown::VERSION
  spec.authors       = ["haoxilu"]
  spec.email         = ["mail@haoxilu.net"]

  spec.summary       = %q{将博客园备份xml转为markdown}
  spec.description   = %q{将博客园备份xml文件通过命令转为markdown文件，或者将博客园备份xml直接转为可以调用的对象}
  spec.homepage      = "https://github.com/haoxilu/cnblog_back_up_to_markdown"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  #spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.executables << 'cnblog_parser'
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", '~> 3.4'
  spec.add_development_dependency "reverse_markdown", '~> 1.0.1'
  spec.add_development_dependency "thor", '~> 0.19.1'
end
