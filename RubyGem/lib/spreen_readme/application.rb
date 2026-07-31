# frozen_string_literal: true
# rbs_inline: enabled

module SpreenReadme
  # Updates the README.md of a repository.
  #
  # The packaging around it is complete; the update logic itself is still to
  # be written, so `run` currently reports the target and succeeds without
  # touching anything.
  class Application
    # @rbs path: String
    # @rbs io: IO
    # @rbs return: Integer
    def self.run(path: '.', io: $stdout)
      new(path:, io:).run
    end

    # @rbs path: String
    # @rbs io: IO
    # @rbs return: void
    def initialize(path: '.', io: $stdout)
      @path = path
      @io   = io
    end

    # @rbs return: Integer
    def run
      io.puts "Target README is #{readme_path}"
      0
    end

    private

    attr_reader :path #: String
    attr_reader :io #: IO

    # @rbs return: String
    def readme_path
      File.absolute_path(File.join(path, 'README.md'))
    end
  end
end
