module ModelPresenter
  module Moneyize
    def moneyize(*fields)
      fields.each do |field|
        define_method "formatted_#{field}" do
          "$ #{Money.new(send(field)).to_dollar}"
        end
      end
    end
  end
end
