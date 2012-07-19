module ModelPresenter
  module Spec
    module Macros
      def as_json_attributes(*keys)
        describe "#as_json" do
          let(:result) { subject.as_json }
          keys.each do |key|
            context "having the key #{key}"
            it "has the key #{key} with value set to presenter.#{key}" do
              if result[key].respond_to?(:should)
                result[key].should eq(subject.send(key))
              else
                expect(result[key]).to eq(subject.send(key))
              end
            end
          end
        end
      end
    end
  end
end

