require_relative '../test_helper'

module ModelPresenter
  describe ForwardFromModel do
    let(:klass) {
      ModelPresenter::TestHelpers.mock_base_class.tap do |c|
        c.send :extend, ForwardFromModel
        c.send :forward_from_model, :attr1, :attr2
      end
    }
    let(:object) {  ModelPresenter::TestHelpers.mock_model_object }

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
