# xivapi-ruby

An asynchronous Ruby client gem for working with [XIVAPI](https://v2.xivapi.com/), providing access to Final Fantasy XIV game data. It lets you fetch, search, and work with FFXIV data using a clean, modern Ruby gem interface.

If you need help or run into any issues, please [open an issue](https://github.com/xivapi/xivapi-ruby/issues) on GitHub or join the [XIVAPI Discord server](https://discord.gg/MFFVHWC) for support.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'xivapi, git: 'https://github.com/xivapi/xivapi-ruby.git', tag: 'v0.4.0'
```

Then run the following in your terminal:

```bash
bundle install
```

## Usage

```ruby
# Client inialization
client = XIVAPI::Client.new
client = XIVAPI::Client.new(language: "jp", version: "7.0", verbose: true)

# Raw requests
client.request("/sheet/Item/1")

# Or using typed endpoints
sheets = XIVAPI::Sheets.new(client) # ~ must pass the client
sheets.get("Item", 1)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/miichom/xivapi. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/xivapi/xivapi-ruby/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Xivapi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/xivapi/xivapi-ruby/blob/main/CODE_OF_CONDUCT.md).
