# frozen_string_literal: true
# rbs_inline: enabled

require 'minitest/autorun'
require_relative '../lib/spreen_readme'

class CLITest < Minitest::Test
  def test_start_updates_the_readme
    status = nil
    capture_io { status = SpreenReadme::CLI.start([]) }

    assert_equal(0, status)
  end

  def test_start_prints_the_version
    out, = capture_io { SpreenReadme::CLI.start(['--version']) }

    assert_equal("#{SpreenReadme::VERSION}\n", out)
  end

  def test_start_prints_the_help
    out, = capture_io { SpreenReadme::CLI.start(['--help']) }

    assert_includes(out, 'Usage: readme-update [options]')
    assert_includes(out, '--path DIR')
  end

  def test_start_honours_the_path_option
    out, = capture_io { SpreenReadme::CLI.start(['--path', 'docs']) }

    assert_includes(out, File.absolute_path(File.join('docs', 'README.md')))
  end

  def test_start_rejects_an_unknown_option
    status = nil
    _, err = capture_io { status = SpreenReadme::CLI.start(['--nope']) }

    assert_equal(1, status)
    assert_includes(err, 'invalid option: --nope')
  end
end
