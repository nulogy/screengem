lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "screengem/version"

Gem::Specification.new do |spec|
  spec.name = "screengem"
  spec.version = Screengem::VERSION
  spec.authors = ["Alistair McKinnell"]
  spec.email = ["alistairm@nulogy.com"]

  spec.summary = "Ruby implementation of the Screengem Pattern."
  spec.homepage = "https://github.com/nulogy/screengem"
  spec.license = "MIT"

  spec.metadata = {
    "homepage_uri" => "https://github.com/nulogy/screengem",
    "changelog_uri" => "https://github.com/nulogy/screengem/blob/master/CHANGELOG.md",
    "source_code_uri" => "https://github.com/nulogy/screengem",
    "bug_tracker_uri" => "https://github.com/nulogy/screengem/issues",
    "rubygems_mfa_required" => "true"
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 3.3"

  spec.add_dependency "activesupport", ">= 7.0", "< 8.0"
  spec.add_dependency "capybara", ">= 3.0", "< 4.0"
  spec.add_dependency "require_all", ">= 3.0", "< 4.0"
  spec.add_dependency "rspec-expectations", "~> 3.12"
end
