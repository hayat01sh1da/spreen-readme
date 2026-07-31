import io
import os

from spreen_readme import Application


def test_run_succeeds() -> None:
    assert 0 == Application.run(io=io.StringIO())


def test_run_announces_the_target_readme() -> None:
    stream = io.StringIO()
    Application.run(path='docs', io=stream)

    expected = os.path.abspath(os.path.join('docs', 'README.md'))
    assert expected in stream.getvalue()


def test_run_defaults_to_the_current_directory() -> None:
    stream = io.StringIO()
    Application.run(io=stream)

    assert os.path.abspath('README.md') in stream.getvalue()
