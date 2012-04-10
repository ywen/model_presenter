Dir["#{File.dirname(__FILE__)}/../../spec/support/**/*.rb"].each {|f| require f}

module ModelPresenter
  class SpecSupport
    attr_reader :config
    private :config
    def initialize(config)
      @config = config
    end

    def register
      config.extend ModelPresenter::Spec::Macros
    end
  end
end
