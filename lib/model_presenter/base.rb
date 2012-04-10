require 'model_presenter/forward_from_model'
require 'model_presenter/as_json'
module ModelPresenter
  module Base
    def self.included(mod)
      mod.extend ForwardFromModel
    end
  end
end
