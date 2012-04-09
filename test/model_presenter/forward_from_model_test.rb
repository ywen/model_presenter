require 'test_helper'

module ModelPresenter
  describe ForwardFromModel do
    let(:klass) {
      Class.new {
        extend ForwardFromModel
        forward_from_model :attr1, :attr2
        attr_reader :model
        private :model
        def initialize(object)
          @model = object
        end
      }
    }
    let(:object) {
      Class.new {
        def attr1
          "value1"
        end
        def attr2
          "value2"
        end
      }.new
    }

    subject { klass.new object }

    describe ".forward_from_model" do
      { :attr1 => "value1", :attr2 => "value2" }.each do |key, value|
        it "generates the method #{key} and returns #{value}" do
          subject.send(key).must_equal(value)
        end
      end

      describe "when passing in a method that doesn't exist in the model object" do
        before(:each) do
          klass.send :forward_from_model, :attr3
        end
        
        it "raises an exception" do
          lambda{subject.attr3}.must_raise(NoMethodError)
        end
      end
    end
  end
end
