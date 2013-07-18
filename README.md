# ModelPresenter

[![Build Status](https://travis-ci.org/ywen/model_presenter.png?branch=master)](https://travis-ci.org/ywen/model_presenter)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/ywen/model_presenter)


ModelPresenter provides basic framework in creating a presenter. The goal of the gem is that the presenter can be used in any Ruby projects that feel it needs to use this pattern, not limited to Rails projects.

The presenter puts more emphasis on JSON representation of a business model object. But it can be used in classic HTML view just as easy.

The gem is not trying to provide a automagic way to look cool. Rather, it focuses on explicitly expressing the intent of a Presenter class. Please read the usage for the details

## What is a presenter

A presenter is a bridge between a business model and how it will be presented (as json, as HTML, as text, as PDF, etc.). A presenter covers logic that is necessary for presenting a business model, but such logic should not be put into the business model because it doesn't belong to.

For example, what attributes are going to be included in the JSON return is not a business model's concern. Another example, If the front end needs to have a person's gender in a humanly readable way (such as "Male" and "Female"), it is not the business model's concern. The business model knows it's gender in some way, it might choose to represent it as a boolean ```model.male?``` and ```model.female?```. It is the responsibility of a presenter to provide what the front end needs. The Presenter may return the string ```Male``` or ```Female``` in its ```gender``` method.

## What is not a presenter

A Presenter is not a place for generating HTML tags and code segments. An HTML file is where you write HTML code in.

## Installation

Add this line to your application's Gemfile:

    gem 'model_presenter'

And then execute:

    $ bundle

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

## Moneyize

The presenter comes with a small helper for format the money. The usage:

```ruby
class User
  include ModelPresenter::Base
  forward_from_model :amount_remains
  moneyize :amount_remains
end
```

What ```moneyize``` does it to define a new method ```formatted_amount_remains``` and return a formatted dollar display string.

NOTE: the ```amount_remains``` is supposed to be the amount in cents

So assuming ```amount_remains``` is ```46780```. The ```formatted_amount_remains``` returns ```$ 467.80```

## has_many

The presenter can define a ```has_many``` relationship

```ruby
class User
  include ModelPresenter::Base
  has_many :groups, presenter_class: Presenters::Group
end
```

The macro will generates a ```groups``` methods, which will return an array. Each element of the array is an instance of ```Presenters::Group``` whose ```model``` is one of the group models that the user has.

## Convention for Using with Rails

In a Rails controller, I always initialize one and only one instance variable for using in the view - an instance of a Presenter class. The presenter has all necessary logic to make the view as dumb as possible. And all the logic can be unit tested just like any PORO, make your testing effort easy and enjoyable.

## Rspec Macros

The gem provides some rspec macros for speeding up your test effort for your presenters. To use it, in your ```spec_helper.rb``` among your other setup:

```ruby

require 'model_presenter/spec_support'
RSpec.configure do |config|
  ModelPresenter::SpecSupport.new(config).register
end
```

And in a presenter test, you can do:

```ruby

describe User do
  forward_from_model_attributes :first_name, :last_name, :email
  as_json_attributes :first_name, :gender
  it_moneyize :amount_remains, :some_other_money_field
end
```

The ```forward_from_model_attributes``` macro will generate the following tests:

```rspec

User
  #first_name
    returns the model.first_name
  #last_name
    returns the model.last_name
  #email
    returns the model.email
```

```as_json_attributes``` macro will generate the following tests:

```rspec

  #as_json
    has the key first_name with value set to presenter.first_name
    has the key gender with value set to presenter.gender
```

```it_moneyize``` macro will generate the following tests:

```rspec
  #formatted_amount_remains
    returns the formatted money in dollar
  #formatted_some_other_money_field
    returns the formatted money in dollar
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
