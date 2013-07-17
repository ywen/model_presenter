module ModelPresenter
  module HasMany
    def has_many(relation, options)
      self.send :define_method, relation do
        instance_variable_name = "@#{relation}"
        instance_variable = instance_variable_get("@#{relation}")
        return instance_variable if instance_variable
        instance_variable_set(
          instance_variable_name,
          model.send(relation).map do |relation_model|
            options[:presenter_class].new relation_model
          end
        )
      end
    end
  end
end

