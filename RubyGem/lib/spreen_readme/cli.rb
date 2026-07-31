# frozen_string_literal: true
# rbs_inline: enabled

require 'optparse'
require_relative 'version'
require_relative 'application'

module SpreenReadme
  # Command line interface behind the `readme-update` executable:
  # `readme-update [--path DIR]`.
  class CLI
    # @rbs argv: Array[String]
    # @rbs return: Integer
    def self.start(argv = ARGV)
      new(argv).run
    end

    # @rbs argv: Array[String]
    # @rbs return: void
    def initialize(argv)
      @argv   = argv.dup
      @path   = '.'
      @action = :update_readme
    end

    # @rbs return: Integer
    def run
      parser.parse!(argv)
      __send__(action)
    rescue OptionParser::ParseError => e
      warn e.message
      1
    end

    private

    attr_reader :argv #: Array[String]
    attr_reader :path #: String
    attr_reader :action #: Symbol

    # @rbs return: Integer
    def update_readme
      Application.run(path:)
    end

    # @rbs return: Integer
    def print_version
      puts VERSION
      0
    end

    # @rbs return: Integer
    def print_help
      puts parser
      0
    end

    # @rbs return: OptionParser
    def parser
      @parser ||= OptionParser.new('Usage: readme-update [options]') do |opt|
        opt.on('--path DIR', 'Repository whose README.md is updated (default: .)') { |value| @path = value }
        opt.on('--version', 'Print the version') { @action = :print_version }
        opt.on('-h', '--help', 'Print this help') { @action = :print_help }
      end
    end
  end
end
