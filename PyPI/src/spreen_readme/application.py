"""Updates the README.md of a repository.

The packaging around it is complete; the update logic itself is still to be
written, so `run` currently reports the target and succeeds without touching
anything."""

import os
import sys
from typing import TextIO


class Application:
    """Updates the README.md of a repository."""

    @classmethod
    def run(cls, path: str = '.', io: TextIO | None = None) -> int:
        return cls(path=path, io=io)._run()

    def __init__(self, path: str = '.', io: TextIO | None = None) -> None:
        self.path = path
        self.io = io if io is not None else sys.stdout

    # private

    def _run(self) -> int:
        print(f'Target README is {self._readme_path()}', file=self.io)
        return 0

    def _readme_path(self) -> str:
        return os.path.abspath(os.path.join(self.path, 'README.md'))
