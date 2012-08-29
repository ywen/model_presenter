require_relative "../test_helper"

module ModelPresenter
  describe Moneyize do
    let(:presenter_class) do
      Class.new do
        extend Moneyize
        moneyize :field1, :field2

        def field1; 45678; end
        def field2; 76590; end
      end
    end
    subject { presenter_class.new }

    describe ".moneyize" do
      it "generates method to return the formmated dollar amount" do
        subject.formatted_field1.must_equal("$ 456.78")
        subject.formatted_field2.must_equal("$ 765.90")
      end
    end

  end
end
