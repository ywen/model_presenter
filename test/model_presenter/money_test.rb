require_relative "../test_helper"

module ModelPresenter
  describe Money do
    describe "#to_dollar" do
      subject { Money.new 56789 }

      context "cents: 56789" do
        it "returns dollor amount" do
          subject.to_dollar.must_equal("567.89")
        end
      end

      context "cents: 56700" do
        subject { Money.new 56700 }

        it "returns dollor amount" do
          subject.to_dollar.must_equal("567.00")
        end
      end

      context "cents: 56760" do
        subject { Money.new 56760 }

        it "returns dollor amount" do
          subject.to_dollar.must_equal("567.60")
        end
      end
    end
  end
end
