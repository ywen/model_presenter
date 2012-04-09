module ModelPresenter
  module ForwardFromModel
    def forward_from_model(*attributes)
      attributes.each do |attr|
        self.send :define_method, attr do
          model.send(attr)
        end
      end
    end
  end
end
