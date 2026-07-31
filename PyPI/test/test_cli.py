import os

import pytest

from spreen_readme import __version__
from spreen_readme.cli import main


def test_main_updates_the_readme(capsys: pytest.CaptureFixture[str]) -> None:
    assert 0 == main([])
    assert os.path.abspath('README.md') in capsys.readouterr().out


def test_main_prints_the_version(capsys: pytest.CaptureFixture[str]) -> None:
    with pytest.raises(SystemExit) as excinfo:
        main(['--version'])

    assert 0 == excinfo.value.code
    assert f'{__version__}\n' == capsys.readouterr().out


def test_main_prints_the_help(capsys: pytest.CaptureFixture[str]) -> None:
    with pytest.raises(SystemExit) as excinfo:
        main(['--help'])

    assert 0 == excinfo.value.code
    assert 'usage: readme-update' in capsys.readouterr().out


def test_main_honours_the_path_option(
        capsys: pytest.CaptureFixture[str]) -> None:
    assert 0 == main(['--path', 'docs'])
    expected = os.path.abspath(os.path.join('docs', 'README.md'))
    assert expected in capsys.readouterr().out


def test_main_rejects_an_unknown_option(
        capsys: pytest.CaptureFixture[str]) -> None:
    with pytest.raises(SystemExit) as excinfo:
        main(['--nope'])

    assert 2 == excinfo.value.code
    assert 'unrecognized arguments: --nope' in capsys.readouterr().err
