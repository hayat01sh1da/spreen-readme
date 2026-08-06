## Supported Versions

- Only the latest release of each package is supported: the RubyGems gem [`spreen-readme`](https://rubygems.org/gems/spreen-readme) and the PyPI library [`spreen-readme`](https://pypi.org/project/spreen-readme/).
- Fixes land on `master` first and ship in the next `ruby-vX.Y.Z` / `python-vX.Y.Z` release; historical tags and forks do not receive backports.

## Ecosystem & Compatibility

| Component            | Version(s) / Tooling                       | Notes                                                                              |
| -------------------- | ------------------------------------------ | ---------------------------------------------------------------------------------- |
| OS baseline          | WSL (Ubuntu 25.10)                         | Development environment; the packages themselves are OS independent.               |
| RubyGems gem         | Ruby >= 3.4 (`required_ruby_version`)      | Standard library only — the gem declares no runtime dependencies.                  |
| Ruby toolchain       | Ruby 4.0.6 (`RubyGem/.ruby-version`)       | Development and CI interpreter; Bundler resolves the development gems.             |
| PyPI library         | CPython >= 3.10 (`requires-python`)        | Standard library only — the library declares no runtime dependencies.              |
| Python toolchain     | CPython 3.14.7 (`PyPI/.python-version`)    | Development and CI interpreter; `requirements.txt` pins the development libraries. |

## Release Integrity

- Both packages publish through **Trusted Publishing / Trusted Publishers (OIDC)** from the tagged release workflows, so no long-lived API tokens exist to leak.
- The gem sets `rubygems_mfa_required`, so a manual push additionally requires MFA.
- Release workflows run only on `ruby-v*` / `python-v*` tag pushes; the PyPI OIDC grant is confined to a dedicated `pypi` deployment environment.

## Backward Compatibility

- The `readme-update` CLI flags remain stable within a major version. Breaking changes to flags or to the library API bump the major version and are documented in [CHANGELOG.md](./CHANGELOG.md).
- The packages are not tested on interpreter majors below the declared floors, and we do not backport security fixes to them.

## Reporting a Vulnerability

Please report issues privately via **GitHub Security Advisory** (preferred) — open through the repository’s **Security → Report a vulnerability** workflow.

Acknowledgement occurs and status updates follow as soon as possible.  
After remediation we publish guidance alongside required dependency updates.
