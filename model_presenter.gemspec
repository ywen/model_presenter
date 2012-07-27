# -*- encoding: utf-8 -*-
require File.expand_path('../lib/model_presenter/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Yi Wen"]
  gem.email         = ["hayafirst@gmail.com"]
  gem.description   = %q{Provides an implementation of Presenter pattern, but without needs fo Rails}
  gem.summary       = %q{Provides an implementation of Presenter pattern}
  gem.homepage      = "https://github.com/ywen/model_presenter"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "model_presenter"
  gem.require_paths = ["lib"]
  gem.version       = ModelPresenter::VERSION
  gem.add_runtime_dependency(%q<json>)
  gem.add_development_dependency(%q<minitest>, "2.12.0")
  gem.add_development_dependency(%q<minitest-growl>)
  gem.add_development_dependency(%q<guard-minitest>)
  gem.add_development_dependency(%q<minitest-wscolor>)
  gem.add_development_dependency(%q<rake>)
  gem.add_development_dependency(%q<mocha>)
  gem.add_development_dependency(%q<minitest-spec-context>)
end
