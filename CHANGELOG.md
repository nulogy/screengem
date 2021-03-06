# Change log

## master (unreleased)

## 0.13.0 (2021-06-13)

* Relax the ActiveSupport dependency
* Latest development dependencies

## 0.12.0 (2021-01-27)

* Relax the thor dependency
* Latest development dependencies

## 0.11.0 (2020-04-26)

### Breaking Changes

* Questions answer negatively by throwing an exception rather than returning false

## 0.10.1 (2020-01-11)

* Relax the thor dependency

## 0.10.0 (2020-01-11)

* Remove action abstraction
* Latest development dependencies

## 0.9.1 (2019-10-22)

* Relax the require_all dependency
* Latest development dependencies

## 0.9.0 (2019-09-25)

* Support for actor memory outside actor instances (support ParameterType actors)

## 0.8.1 (2019-08-20)

* Support for Rails 6 (only ActiveSupport)
* Latest development dependencies

## 0.8.0 (2019-06-27)

### New Features

* Auto visit on all public ScreenElement methods including inherited methods.

## 0.7.3 (2019-05-27)

### New Features

* Add routes method to screen elements to expose Rails.application.routes.

## 0.7.2 (2019-04-25)

### New Features

* Improved error message when a fact cannot be recalled.

## 0.7.1 (2019-04-20)

### Bug fixes

* Fixed failure to generate screen element methods unless no arg constructor.

## 0.7.0 (2019-04-18)

### New Features

* Introduce the `visit_path` method for subclasses of ScreenElement (no need to call `visit`).

### Bug fixes

* Load the Rails environment to run the `screengem` command that creates dampening configurations

## 0.6.0 (2019-04-11)

### New Features

* Whenever an actor recalls a value perform a `reload` on the value. Avoid the `reload` by passing `false` to the `reload:` argument.

## 0.5.0 (2019-03-28)

### New Features

* [RSpec Expectations](https://github.com/rspec/rspec-expectations) are available in all primitives: actions, questions, and tasks.

## 0.4.0 (2019-03-18)

### New Features

* Rename Screengem::FeaturePage to Screengem::ScreenElement

## 0.3.0 (2019-03-16)

### New Features

* Scope screen elements to the `screen` instance variable
* Screen elements are no longer memoized
* Add example step definitions to the README

## 0.2.0 (2019-03-12)

### New features

* Added the `dampen_for` class macro for questions and tasks

### Bug fixes

* Expose the `screengem generate` command for creating dampening configurations
