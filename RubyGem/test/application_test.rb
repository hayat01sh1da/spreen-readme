# frozen_string_literal: true
# rbs_inline: enabled

require 'minitest/autorun'
require 'stringio'
require_relative '../lib/spreen_readme'

class ApplicationTest < Minitest::Test
  def setup
    @io = StringIO.new
  end

  def test_run_succeeds
    assert_equal(0, SpreenReadme::Application.run(io:))
  end

  def test_run_announces_the_target_readme
    SpreenReadme::Application.run(path: 'docs', io:)

    assert_includes(io.string, "Target README is #{File.absolute_path(File.join('docs', 'README.md'))}")
  end

  def test_run_defaults_to_the_current_directory
    SpreenReadme::Application.run(io:)

    assert_includes(io.string, "Target README is #{File.absolute_path('README.md')}")
  end

  private

  attr_reader :io
end
