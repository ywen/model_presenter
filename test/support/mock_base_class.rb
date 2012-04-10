module ModelPresenter
  module TestHelpers
    def self.mock_base_class
      Class.new do
        attr_reader :model
        private :model
        def initialize(model)
          @model = model
        end
      end
    end
  end
end
