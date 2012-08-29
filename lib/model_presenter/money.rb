module ModelPresenter
  class Money
    attr_reader :amount_in_cents

    def initialize(amount_in_cents)
      @amount_in_cents = amount_in_cents
    end

    def to_dollar
      amount_in_dollar = amount_in_cents.to_f / 100
      amount_in_dollar.to_s
    end
  end
end
