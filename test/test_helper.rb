require 'rubygems'
gem 'minitest'
require 'minitest/autorun'
require 'minitest/wscolor'
require 'mocha'
require 'model_presenter'
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
