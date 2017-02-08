# Dipswitch

Super simple feature flag switcher.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dipswitch'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dipswitch

## Usage

Configure Dipswitch before calling it. In a Rails app you might want to do this
in an initializer for example.

```ruby
  Dipswitch.configure do |config|
    config.feature(:new_ui) do |user|
      user.admin?
    end

    config.feature(:beta) do |user|
      ['bella'].include?(user.username)
    end

  end
```

In your application code ask Dipswitch if a feature is enabled:

```ruby
  if Dipswitch.on?(:new_ui, current_user)
    # do stuff
  end
```

That's it.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rainkinz/dipswitch.

