[![Actions Status: PyPI - CI](https://github.com/hayat01sh1da/spreen-readme/workflows/PyPI%20-%20CI/badge.svg)](https://github.com/hayat01sh1da/spreen-readme/actions?query=workflow%3A%22PyPI%20-%20CI%22)
[![Actions Status: PyPI - Daily Dependencies Update](https://github.com/hayat01sh1da/spreen-readme/workflows/PyPI%20-%20Daily%20Dependencies%20Update/badge.svg)](https://github.com/hayat01sh1da/spreen-readme/actions?query=workflow%3A%22PyPI%20-%20Daily%20Dependencies%20Update%22)
[![Actions Status: RubyGem - CI](https://github.com/hayat01sh1da/spreen-readme/workflows/RubyGem%20-%20CI/badge.svg)](https://github.com/hayat01sh1da/spreen-readme/actions?query=workflow%3A%22RubyGem%20-%20CI%22)
[![Actions Status: RubyGem - Daily Dependencies Update](https://github.com/hayat01sh1da/spreen-readme/workflows/RubyGem%20-%20Daily%20Dependencies%20Update/badge.svg)](https://github.com/hayat01sh1da/spreen-readme/actions?query=workflow%3A%22RubyGem%20-%20Daily%20Dependencies%20Update%22)
[![Actions Status: CodeQL](https://github.com/hayat01sh1da/spreen-readme/workflows/CodeQL/badge.svg)](https://github.com/hayat01sh1da/spreen-readme/actions?query=workflow%3A%22CodeQL%22)

# spreen-readme

<img src="./assets/spreen-readme-icon.svg" align="center" width="300" alt="spreen-readme: an origami falcon stooping across an ink-blue stone, a stale README page drifting ahead of its dive and its lines left settled into order in its wake" />

## 1. Overview

**spreen-readme** — the falcon's stoop, then the preen — keeps `README.md` up to date from the repository it documents.  
It ships as a RubyGems gem and a PyPI library, both installing the same `readme-update` CLI.

The icon tells the story: the origami falcon (隼 /hayabusa/) mid-stoop across the ink-blue stone, a stale README page drifting out of date ahead of its dive and its lines left flush and in order in the wake — the documentation, settled.  
The full legend behind the `spreen` name is told in [spreen-wiki's README](https://github.com/hayat01sh1da/spreen-wiki#1-origin-of-the-name).

```command
$ readme-update --path .
Target README is /home/hayat01sh1da/workspace/your-repo/README.md
```

Part of the `spreen-*` toolchain ([spreen-wiki](https://github.com/hayat01sh1da/spreen-wiki), [spreen-pr](https://github.com/hayat01sh1da/spreen-pr), [spreen-tracks](https://github.com/hayat01sh1da/spreen-tracks), [spreen-clean](https://github.com/hayat01sh1da/spreen-clean), spreen-readme): tools that take something scattered and return it settled.

> [!NOTE]
> The packaging, CI and release pipelines are complete; the README-updating logic itself is still to be written.  
> `readme-update` currently reports the `README.md` it would update and exits successfully, so the whole pipeline is exercisable end to end while the behaviour lands.

## 2. Installation

Install from either ecosystem — the CLI is identical:

```command
$ gem install spreen-readme
```

```command
$ pipx install spreen-readme
```

(`pip install spreen-readme` works too if you prefer managing the environment yourself.)

## 3. Usage

```command
$ readme-update [options]
```

- `--path DIR` sets the repository whose `README.md` is updated (default: the current directory).
- `--version` prints the version; `--help` prints the usage.

Both packages also expose the logic as a library — see the per-language READMEs below.

## 4. Development

- Common environment: WSL (Ubuntu 25.10)
- [Ruby README](./RubyGem/README.md) / [Ruby sources](./RubyGem/)
- [Python README](./PyPI/README.md) / [Python sources](./PyPI/)
