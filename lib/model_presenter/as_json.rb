module ModelPresenter
  module AsJson
    def json_properties(*properties)
      self.send :define_method, :as_json do |options = {}|
        properties.inject({}) do |results, property|
          results.merge! property => send(property)
        end
      end
    end
  end
end
