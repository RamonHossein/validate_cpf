# ValidateCpf

Validate CPF.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'validate_cpf'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install validate_cpf

## Usage

Just use as any other validator:

```ruby
class User < ActiveRecord::Base
    validates :cpf, cpf: true
end
```

## Mantainers
[@RamonHossein](https://github.com/RamonHossein)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
