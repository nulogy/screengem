# Change log

## master (unreleased)

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
