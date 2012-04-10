module ModelPresenter
  module Spec
    module Macros
      def forward_from_model_attributes(*attributes)
        attributes.each do |attribute|
          describe "##{attribute}" do
            it "returns the model.#{attribute}" do
              subject.send(attribute).should eq(model.send(attribute))
            end
          end
        end
      end
    end
  end
end
