require_relative '../test_helper'

module ModelPresenter
  describe HasMany do
    describe ".has_many" do
      subject { klass.new object }

      let(:relationship_class) {
        Class.new do
          include ModelPresenter::Base
        end
      }

      let(:klass) {
        ModelPresenter::TestHelpers.mock_base_class.tap do |c|
          c.send :extend, HasMany
          c.send :has_many, :test_relationships, presenter_class: relationship_class
        end
      }
      let(:object) {  ModelPresenter::TestHelpers.mock_model_object }
      let(:test_relationship1) { stub :test_relationship1 }
      let(:test_relationship2) { stub :test_relationship2 }

      before(:each) do
        object.stubs(:test_relationships).returns([test_relationship1, test_relationship2])
      end

      it "creates a test_relationships method" do
        subject.must_respond_to :test_relationships
      end

      it "returns an array of objects" do
        subject.test_relationships.size.must_equal 2
      end

      it "returns presenter version for each array member" do
        relationship_class.expects(:new).with(test_relationship1).returns "presenter1"
        relationship_class.expects(:new).with(test_relationship2).returns "presenter2"
        subject.test_relationships.must_equal ["presenter1", "presenter2"]
      end

      it "caches the array" do
        relationship_class.expects(:new).with(test_relationship1).returns "presenter1"
        relationship_class.expects(:new).with(test_relationship2).returns "presenter2"
        subject.test_relationships
        relationship_class.expects(:new).never
        subject.test_relationships.must_equal ["presenter1", "presenter2"]
      end
    end
  end
end
