# Change log

## main (unreleased)

## 0.21.1 (2024-10-03)

### Bug fixes

* Handle special cases for the URI auto visit
  * Empty query
  * Empty fragment

## 0.21.0 (2024-10-03)

### New Features

* Auto visit considers all of the URI

### Breaking Changes

* Drop support for Ruby 3.0 and Ruby 3.1

## 0.20.1 (2023-10-16)

* Support Rails 7.1.x
* Latest development dependencies
* Address rubocop violations
* Rework the .gitignore file

## 0.20.0 (2023-10-16)

* Support Rails 7.1.1

## 0.19.0 (2023-03-13)

* Support Rails 7.0

### Breaking Changes

* Drop support for Ruby 2.7
* Drop support for Rails 5.2

## 0.18.1 (2023-03-05)

* Refine support for Ruby 3.x

## 0.18.0 (2023-02-04)

* Support Ruby 3.x

## 0.17.0 (2022-10-11)

### Breaking Changes

* Drop support for dampening

## 0.16.0 (2022-08-03)

* Allow actor to recall with a default
* Update the capybara dependency
* Latest development dependencies

## 0.15.0 (2022-01-23)

* Add actor hooks

## 0.14.0 (2022-01-06)

* Update the thor dependency
* Latest development dependencies

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
