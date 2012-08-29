require "model_presenter/version"
require 'model_presenter/base'
Dir["#{File.expand_path(File.dirname(__FILE__))}/model_presenter/**/*.rb"].each do |f| 
  require f
end
