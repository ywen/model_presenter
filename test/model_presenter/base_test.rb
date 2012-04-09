require 'test_helper'

module ModelPresenter
  describe Base do
    let(:klass) {
      Class.new {
        include Base
      }
    }

    describe ".forward_public_attributes" do
      before(:each) do
        klass.send :forward_public_attributes
      end

      it "have all the attributes" do
      end
      
    end
  end
end
