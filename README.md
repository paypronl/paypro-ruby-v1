![PayPro](https://www.paypro.nl/images/logo-ie.png)
# Ruby Client for PayPro API v1
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/paypro.svg)](https://badge.fury.io/rb/paypro)
[![circleci](https://img.shields.io/circleci/project/github/RedSparr0w/node-csgo-parser.svg)](https://circleci.com/gh/paypronl/paypro-ruby-v1)

This library provides a Ruby client to connect with the PayPro API.

## Requirements

 - Ruby >= 2.4.0

## Installation

Installation is pretty standard:

```sh
$ gem install paypro
```

if you'd rather install the PayPro client using `bundler` you can put this in your Gemfile:

```ruby
source 'https://rubygems.org'

gem 'paypro'
```

Or directly from the GitHub repository:

```ruby
gem 'paypro', git: 'https://github.com/paypronl/paypro-ruby-v1'
```

## Getting started

Example of creating a payment:

```ruby
require 'paypro'

client = PayPro::Client.new('YOUR_API_KEY')
client.command = 'create_payment';
client.params = { amount: 500, consumer_email: 'test@paypro.nl', pay_method: 'ideal/INGBNL2A' }
client.execute
```

## Documentation

For guides and code examples you can go to https://www.paypro.nl/developers/docs.

## Contributing
If you want to contribute to this project you can fork the repository. Create a new branch, add your feature and create a pull request. We will look at your request and determine if we want to add it.

## License
[MIT](https://github.com/paypronl/paypro-ruby-v1/blob/master/LICENSE)
