## 1. Environment

- Python 3.14.6
- pip 26.2

## 2. Install Libraries via requirements.txt

```command
$ pip install -r requirements.txt
```

## 3. Execution

```command
$ invoke update_readme
========== Start Updating README ===========
========== Finished Updating README ===========
```

## 4. Unit Test

```command
$ invoke
============================= test session starts ==============================
platform linux -- Python 3.14.6, pytest-9.0.3, pluggy-1.6.0
rootdir: /mnt/c/Users/binlh/Development/personal/readme-updaters/python
configfile: pyproject.toml
collected 1 item

test/test_application.py .                                               [100%]

============================== 1 passed in 0.12s ===============================
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
Success: no issues found in 4 source files
```
