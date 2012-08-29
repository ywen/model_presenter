require_relative "../test_helper"

module ModelPresenter
  describe Money do
    subject { Money.new 56789 }

    describe "#to_dollar" do
      it "returns dollor amount" do
        subject.to_dollar.must_equal("567.89")
      end
    end
  end
end
