# ModelPresenter

[![Build Status](https://secure.travis-ci.org/ywen/model_presenter.png)](http://travis-ci.org/ywen/model_presenter)

ModelPresenter provides basic framework in creating a presenter. The goal of the gem is that the presenter can be used in any Ruby projects that feel it needs to use this pattern, not limited to Rails projects.

The presenter puts more emphasis on JSON representation of a business model object. But it can be used in classic HTML view just as easy.

The gem is not trying to provide a automagic way to look cool. Rather, it focuses on explicitly expressing the intent of a Presenter class. Please read the usage for the details

## Installation

Add this line to your application's Gemfile:

    gem 'model_presenter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install model_presenter

## Usage

An example presenter that uses the ```ModelPresenter::Base```

```ruby

class User
  include ModelPresenter::Base
  forward_from_model :last_name, :first_name, :email
  json_properties :name, :gender, :email

  def name
    "#{first_name} #{last_name}"
  end

  def gender
    model.gender == "M" ? "Male" : "Female"
  end
end
```

The ```forward_from_model``` defines methods ```attr1``` and ```attr2``` which calls the ```model.attr1``` ```model.attr2``` respectively.

The ```json_properties``` defines methods ```as_json```  which returns a hash in which the keys are the properties being passed in the ```json_properties``` and the value of a given property the ```presenter_object.property```

An example output of ```as_json``` returns:

```json

{
  name: "John Smith",
  gender: "Male",
  email: "jsmith@example.com"
}
```

Then one can use ```presenter_object.to_json``` to serilize it into a JSON string.

A presenter instance can be initialized with 

```ruby

user = User.new(user_model)
user.to_json
```

It always takes a model object as the only argument in the initializer. The model object is referred from within the presenter as ```presenter.model```. It is a private attribute reader.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
