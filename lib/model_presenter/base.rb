module ModelPresenter
  module Base
    def self.included(mod)
      mod.extend ForwardFromModel
    end
  end
end
