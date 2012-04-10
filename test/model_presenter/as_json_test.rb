require_relative "../test_helper"

module ModelPresenter
  describe AsJson do
    let(:klass) {
      ModelPresenter::TestHelpers.mock_base_class.tap do |c|
        c.send :extend, AsJson
        c.send :json_properties, :attr1, :attr2
        c.send :define_method, :attr1 do 
          "value1" 
        end
        c.send :define_method, :attr2 do 
          "value2"
        end
      end
    }
    let(:object) { Object.new }
    subject {klass.new object}
    describe ".json_properties" do
      it "generates as_json method" do
        subject.must_respond_to :as_json
      end
    end
    describe "#as_json" do
      let(:result) { subject.as_json }
      { :attr1 => "value1", :attr2 => "value2" }.each do |key, value|
        it "generates a JSON contains the key ''#{key}' with the value '#{value}' " do
          result[key].must_equal value
        end
      end
    end
  end
end
