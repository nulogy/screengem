# Screengem

A simple Ruby implementation of the [Screenplay Pattern](https://ideas.riverglide.com/page-objects-refactored-12ec3541990). 

Screengem promotes writing step definitions in terms of actors, the tasks that the actor performs, 
and the questions that the actor asks. 

## Example Step Definitions

```ruby
Given(/^that they are signed in and viewing the (.+?)$/) do |section_name|
  actor.performs(task.sign_in, task.remember_signature_counter(section_name))
end

Then(/^their signature is captured$/) do
  actor.asks(question.signature_captured)
end
```

## Core Domain Model

An Actor asks questions and performs tasks.
An Actor is able to remember and recall key-value pairs.

A Question responds to answer.

A Task responds to perform and may execute one or more actions.

![Core Domain Model](/images/ScreengemCore.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'screengem'
```

## Dampening

It sometimes makes sense to slow down the automation. This is known as dampening.

To enable and configure dampening perform the following steps:

1. Create a sample dampening configuration `screengem generate --root features_screenplay`
1. Tweak the sample dampening configuration
1. Promote the sample dampening configuration `cp ./features_screenplay/dampen_configuration.yml.sample ./dampen_configuration.yml`
1. Enable dampening `export APPLY_DAMPENING=1`


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nulogy/screengem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Screengem project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/nulogy/screengem/blob/master/CODE_OF_CONDUCT.md).
