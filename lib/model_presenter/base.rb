require 'json/ext'
require 'model_presenter/forward_from_model'
require 'model_presenter/as_json'
require 'model_presenter/money'
require 'model_presenter/moneyize'
require 'model_presenter/has_many'

module ModelPresenter
  module Base
    attr_reader :model
    private :model
    def self.included(mod)
      mod.extend ForwardFromModel
      mod.extend AsJson
      mod.extend Moneyize
      mod.extend HasMany
    end

    def initialize(model)
      @model = model
    end

    def to_json(options={})
      JSON(as_json(options))
    end
  end
end
