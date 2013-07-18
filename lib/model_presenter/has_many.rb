module ModelPresenter
  module HasMany
    # The DSL adds an instance method `relation` to represnet a `has_many` relationship
    #
    # `
    #
    # class User
    #   include ModelPresenter::Base
    #   has_many :groups, presenter_class: Presenters::Group
    # end
    #
    # `
    #
    # The macro will generates a ```groups``` methods, which will return an array. Each element of the array is an instance of ```Presenters::Group``` whose ```model``` is one of the group models that the user has.
    #
    # @param [Symbol, #read] relation the name of the relationship
    # @param [Hash, #read] options Currently it accepts one key `presenter_class` is a class. The class is supposed to be a presenter class. The `relation` method will return an array of elements that are instances of the class
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

