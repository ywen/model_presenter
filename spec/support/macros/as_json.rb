module ModelPresenter
  module Spec
    module Macros
      def as_json_attributes(*keys)
        describe "#as_json" do
          let(:result) { subject.as_json }
          keys.each do |key|
            context "having the key #{key}"
            it "has the key #{key} with value set to presenter.#{key}" do
              result[key].should eq(subject.send(key))
            end
          end
        end
      end
    end
  end
end

