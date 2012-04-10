module ModelPresenter
  module TestHelpers
    def self.mock_model_object
      Class.new do
        def attr1
          "value1"
        end
        def attr2
          "value2"
        end
      end.new
    end
  end
end

