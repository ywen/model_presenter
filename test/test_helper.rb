require 'rubygems'
require 'spork'

Spork.prefork do
  require 'rubygems'
  gem 'minitest'
  require 'minitest/autorun'
  require 'minitest/pride'
  require 'model_presenter'
end

Spork.each_run do
end
