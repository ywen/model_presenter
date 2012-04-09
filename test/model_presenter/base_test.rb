require_relative '../test_helper'

module ModelPresenter
  describe Base do
    let(:klass) {
      Class.new do
        include Base 
      end
    }
    describe ".forward_from_model" do
      it "responds to .forward_from_model" do
        klass.must_respond_to :forward_from_model
      end
    end
  end
end
