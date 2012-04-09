# -*- encoding: utf-8 -*-
require File.expand_path('../lib/model_presenter/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Yi Wen"]
  gem.email         = ["hayafirst@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "model_presenter"
  gem.require_paths = ["lib"]
  gem.version       = ModelPresenter::VERSION
  gem.add_development_dependency(%q<minitest>)
  gem.add_development_dependency(%q<minitest-growl>)
  gem.add_development_dependency(%q<guard-minitest>)
end
