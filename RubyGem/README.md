## 1. Environment

- Ruby 4.0.6
- Gemfile 4.0.20
- Bundler 4.0.20

## 2. Installation

```command
$ gem install spreen-readme
```

Requires Ruby 3.4+.

For development, install the dependencies via Gemfile and Bundler:

```command
$ bundle install
$ bundle lock --add-checksums
```

## 3. Execution

```command
$ readme-update --path .
Target README is /home/hayat01sh1da/workspace/your-repo/README.md
```

With no arguments, `readme-update` targets the `README.md` of the current directory (`--path` defaults to `.`).

As a library:

```ruby
require 'spreen_readme' # or require 'spreen-readme'

SpreenReadme::Application.run(path: '.')

# The progress log goes to stdout by default; pass any IO to capture it.
require 'stringio'
io = StringIO.new
SpreenReadme::Application.run(path: '.', io:)
io.string # => "Target README is /home/hayat01sh1da/workspace/your-repo/README.md\n"
```

> [!NOTE]
> The README-updating logic itself is still to be written: `Application#run` reports the target and returns `0` without touching the file.

## 4. Unit Test

```command
$ bundle exec rake
Run options: --seed 47581

# Running:

........

Finished in 0.002408s, 3322.9354 runs/s, 6645.8708 assertions/s.

8 runs, 16 assertions, 0 failures, 0 errors, 0 skips
```

## 5. Static Code Analysis

```command
$ bundle exec rubocop
Inspecting 12 files
............

12 files inspected, no offenses detected
```

## 6. Type Checks

```command
$ bundle exec rbs-inline --output sig/generated/ lib test
🎉 Generated 7 RBS files under sig/generated
$ bundle exec steep check
# Type checking files:

..............

No type error detected. 🫖
```

## 7. Build & Release

```command
$ gem build spreen-readme.gemspec
$ gem install ./spreen-readme-0.1.0.gem
```

Releases are tagged `ruby-vX.Y.Z`; update [CHANGELOG.md](../CHANGELOG.md) with every release.
