module ModelPresenter
  module Spec
    module Macros
      def forward_from_model_attributes(*attributes)
        attributes.each do |attribute|
          describe "##{attribute}" do
            it "returns the model.#{attribute}" do
              allow(model).to receive(attribute).and_return(attribute)
              result = presenter.send(attribute)
              if result.respond_to?(:should)
                expect(result).to eq(model.send(attribute))
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
