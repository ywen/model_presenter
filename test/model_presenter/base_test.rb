require_relative '../test_helper'

module ModelPresenter
  describe Base do
    let(:klass) {
      Class.new do
        include Base 
        json_properties :attr1, :attr2
      end
    }

    let(:object) {  ModelPresenter::TestHelpers.mock_model_object }
    subject { klass.new object }
    describe ".forward_from_model" do
      it "responds to .forward_from_model" do
        klass.must_respond_to :forward_from_model
      end
    end

    describe ".json_properties" do
      it "responds to .json_properties" do
        klass.must_respond_to :json_properties
      end
    end

    describe ".moneyize" do
      it "responds to .moneyize" do
        klass.must_respond_to :moneyize
      end
    end

    describe "#to_json" do
      before(:each) do
        subject.stubs(:as_json).returns(:attr1 => "value1", :attr2 => "value2")
      end
      
      it "convert the as_json hash to JSON string" do
        subject.to_json.must_equal JSON(:attr1 => "value1", :attr2 => "value2")
      end
    end
  end
end
