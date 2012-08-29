module Macros
  module System
    def it_moneyize(*fields)
      fields.each do |field|
        describe "#formatted_#{field}" do
          let(:expected) { subject.send("formatted_#{field}") }
          let(:actual) { "$ #{subject.send(field).to_f/100}" }
          it "returns the formatted money in dollar" do
            expect(expected).to eq( actual )
          end
        end
      end
    end
  end
end
