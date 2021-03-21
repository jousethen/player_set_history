# PlayerSetHistory

Welcome! This gem will provide a CLI interface to the smash.gg API for the purpose of pulling a player's set history as well as provide basic profile information.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Before starting you will need. 


```
- Smash.GG API Key. It's free!
- Basic Knowledge of smash.gg 
```

### Installing

A step by step series of examples that tell you how to get a development env running

Clone this repository and modify bin/player_set_history so that your API key gets passed to the call

```
PlayerSetHistory::CLIManager.new(api_key: "832djsadjahde838392482sd23").call
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'sway'/player_set_history. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PlayerSetHistory project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'sway'/player_set_history/blob/master/CODE_OF_CONDUCT.md).
