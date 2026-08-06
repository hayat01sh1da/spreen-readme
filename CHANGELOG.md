# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).  
One repository hosts two packages, so releases are tagged per ecosystem (`ruby-vX.Y.Z` for the RubyGems gem, `python-vX.Y.Z` for the PyPI library).

## [0.1.0] - 2026-08-06

### 1. Added

- Ruby gem packaging: `SpreenReadme` module under `RubyGem/lib/`, `require 'spreen-readme'` shim, `spreen-readme.gemspec`, `exe/readme-update`, and RBS signatures shipped in the gem.
- Python packaging: `spreen_readme` package under `PyPI/src/`, full PyPI metadata in `pyproject.toml`, `readme-update` console script, and the `py.typed` marker.
- `readme-update` CLI with a `--path` option selecting the repository whose `README.md` is updated (default: `.`), plus `--version` and `--help`, replacing the interactive `rake update_readme` / `invoke update_readme` tasks as the packaged entry point (Ruby and Python).
- Injectable output stream: `Application` writes its progress log to an `io` argument (default: stdout), so the behaviour is assertable from the tests in both ecosystems.
- Release automation: `RubyGem/Rakefile` defines the Bundler gem tasks with the `ruby-` tag prefix, `.github/workflows/rubygem--release.yml` publishes via RubyGems Trusted Publishing on `ruby-v*` tags, and `.github/workflows/pypi--release.yml` publishes via PyPI Trusted Publishers on `python-v*` tags with the OIDC grant isolated in a `pypi`-environment publish job.
- Ecosystem-scoped toolchain version files `RubyGem/.ruby-version` and `PyPI/.python-version`, alongside the repository-root ones; `ruby/setup-ruby` resolves the Ruby version from the former during the release run.
- CLI test suites in both ecosystems (`RubyGem/test/cli_test.rb`, `PyPI/test/test_cli.py`) covering the default run, `--path`, `--version`, `--help` and unknown-option handling.

### 2. Changed

- Named the packages **`spreen-readme`** per the `spreen-<function>` family naming, following the repository rename from `readme-updaters`: RubyGem `spreen-readme` (`SpreenReadme`), PyPI `spreen-readme` (`spreen_readme`), CLI `readme-update`.
- Renamed the ecosystem directories and workflow prefixes — `ruby/` → `RubyGem/` (`Ruby - *` → `RubyGem - *` workflows) and `python/` → `PyPI/` (`Python - *` → `PyPI - *`) — aligning the CI and daily-update workflows with the `rubygem--release.yml` / `pypi--release.yml` release-workflow convention.
- `RubyGem/.rubocop.yml` targets Ruby 3.4 to match the gemspec's `required_ruby_version` (was 4.0, the development toolchain version), and allows rbs-inline `#:` annotations.
- `RubyGem/Steepfile` type-checks `lib` instead of `src` and loads the `optparse` signatures for the CLI.
- Renamed `LICENSE` to `LICENSE.txt` and vendored a copy into each ecosystem directory so both packages ship their licence.
- The daily dependency-update workflows operate on the renamed directories and mirror the dependency versions into the per-ecosystem READMEs.

### 3. Removed

- Flat `ruby/src/` and `python/src/` script layouts and the interactive Rake/Invoke tasks (superseded by the packages and the CLI above); the `invoke` dependency is gone.

> [!NOTE]
> The README-updating logic itself is not implemented yet: `Application#run` reports the target `README.md` and exits successfully. This entry covers the packaging and release scaffolding around it.
