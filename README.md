# pingdom-cli [![Build Status](https://secure.travis-ci.org/toyama0919/pingdom-cli.png?branch=master)](http://travis-ci.org/toyama0919/pingdom-cli)

pingdom simple command line interface

## Examples

### list checks

    $ pingdom-cli checks

### pause checks

    $ pingdom-cli pause

### unpause checks

    $ pingdom-cli unpause

## Settings

create $HOME/.pingdomrc

```yaml
user: 'hogehoge@gmail.com'
password: 'hogehoge'
app_key: '123456hogehogehogehogehogehogehogehogehogehoge'
```

## Installation

Add this line to your application's Gemfile:

    gem 'pingdom-cli'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pingdom-cli

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new [Pull Request](../../pull/new/master)

## Information

* [Homepage](https://github.com/toyama0919/pingdom-cli)
* [Issues](https://github.com/toyama0919/pingdom-cli/issues)
* [Documentation](http://rubydoc.info/gems/pingdom-cli/frames)
* [Email](mailto:toyama0919@gmail.com)

## Copyright

Copyright (c) 2014 Hiroshi Toyama

See [LICENSE.txt](../LICENSE.txt) for details.
