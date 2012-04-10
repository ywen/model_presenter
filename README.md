# ModelPresenter

[![Build Status](https://secure.travis-ci.org/ywen/model_presenter.png)](http://travis-ci.org/ywen/model_presenter)

ModelPresenter provides basic framework in creating a presenter.

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
  forward_from_model :attr1, :attr2
end
```

The ```forward_from_model``` defines methods ```attr1``` and ```attr2``` which calls the ```model.attr1``` ```model.attr2``` respectively.

A presenter instance can be initialized with 

```ruby

user = User.new(user_model)
```

It always takes a model object as the only argument in the initializer. The model object is referred from within the presenter as ```presenter.model```. It is a private attribute reader.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
