# Mina::Npm

Npm plugin for [mina](https://github.com/mina-deploy/mina)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mina-npm'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mina-npm

## Usage

  require 'mina/npm'

  task :deploy => :environment do
    deploy do
      ...
      invoke 'npm:install'
      invoke 'bower:install'
      invoke 'grunt:task'
      ...
    end
  end


## Configuration

    set :npm_bin # default: 'npm'
    set :bower_bin # default: 'bower'
    set :grunt_bin # default: 'grunt'
    set :npm_options # default: '--production'
    set :bower_options # default: '--allow-root'
    set :grunt_options # default: ''
    set :grunt_task # default: 'build'

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mina-npm. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
