module ModelPresenter
  module Spec
    module Macros
      def forward_from_model_attributes(*attributes)
        attributes.each do |attribute|
          describe "##{attribute}" do
            it "returns the model.#{attribute}" do
              model.stub(attribute).and_return(attribute)
              result = subject.send(attribute)
              if result.respond_to?(:should)
                result.should eq(model.send(attribute))
              else
                expect(result).to eq(model.send(attribute))
              end
            end
          end
        end
      end
    end
  end
end
