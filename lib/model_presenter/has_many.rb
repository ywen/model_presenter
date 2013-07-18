module ModelPresenter
  module HasMany
    # The DSL adds an instance method `relation`
    #
    # @param [Symbol, #read] the name of the relationship
    # @param [Hash, #read] key `presenter_class` is a class. The class is
    # supposed to be a presenter class. The `relation` method will return an
    # array of elements that are instances of the class
    #
    # @return none
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

