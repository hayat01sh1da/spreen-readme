## 1. Environment

- Python 3.14.7
- pip 26.2.1

## 2. Installation

```command
$ pipx install spreen-readme
```

(`pip install spreen-readme` works too if you prefer managing the environment yourself.) Requires Python 3.10+.

For development, install the dependencies via requirements.txt:

```command
$ pip install -r requirements.txt
```

## 3. Execution

```command
$ readme-update --path .
Target README is /home/hayat01sh1da/workspace/your-repo/README.md
```

With no arguments, `readme-update` targets the `README.md` of the current directory (`--path` defaults to `.`).

As a library:

```python
from spreen_readme import Application

Application.run(path='.')

# The progress log goes to stdout by default; pass any text stream to capture it.
import io
stream = io.StringIO()
Application.run(path='.', io=stream)
stream.getvalue()  # => 'Target README is /home/hayat01sh1da/workspace/your-repo/README.md\n'
```

The package ships `py.typed`.

> [!NOTE]
> The README-updating logic itself is still to be written: `Application.run` reports the target and returns `0` without touching the file.

## 4. Unit Test

```command
$ pytest
============================= test session starts ==============================
platform linux -- Python 3.14.7, pytest-9.1.1, pluggy-1.6.0
rootdir: spreen-readme/PyPI
configfile: pyproject.toml
testpaths: test
collected 8 items

test/test_application.py ...                                             [ 37%]
test/test_cli.py .....                                                   [100%]

============================== 8 passed in 0.32s ===============================
```

## 5. Static Code Analysis

```command
$ flake8 .
$ autoflake8 --in-place --remove-duplicate-keys --remove-unused-variables --recursive .
$ autopep8 --in-place --aggressive --aggressive --recursive .
```

## 6. Type Checks

```command
$ mypy .
Success: no issues found in 6 source files
```

## 7. Build & Release

```command
$ python -m build
$ twine check dist/*
$ pipx install ./dist/spreen_readme-0.1.0-py3-none-any.whl
```

Releases are tagged `python-vX.Y.Z`; update [CHANGELOG.md](../CHANGELOG.md) with every release.
