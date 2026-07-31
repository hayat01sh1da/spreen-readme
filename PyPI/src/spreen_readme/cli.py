"""Command line interface behind the `readme-update` executable:
`readme-update [--path DIR]`."""

import argparse
import sys

from . import __version__
from .application import Application


def _build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog='readme-update',
        description='Keep README.md up to date from the repository it '
                    'documents.')
    parser.add_argument(
        '--path', default='.',
        help='Repository whose README.md is updated (default: .)')
    parser.add_argument('--version', action='version', version=__version__)
    return parser


def main(argv: list[str] | None = None) -> int:
    args = _build_parser().parse_args(argv)
    return Application.run(path=args.path)


if __name__ == '__main__':
    sys.exit(main())
