require "optparse"
require "gitio"

module Gitio
  class CLI

    def initialize(arguments)
      begin
        url, options = parse!(arguments)
      rescue OptionParser::InvalidOption => e
        error e
      end

      if options[:code]
        puts Gitio.shorten(url, options[:code])
      else
        puts Gitio.shorten(url)
      end

    rescue Gitio::Error => e
      error e
    end

    private

    # Parse the command-line arguments, returning the URL and a hash of options.
    def parse!(arguments)
      options = {}

      OptionParser.new do |opts|
        opts.program_name = "git.io"
        opts.banner = "Usage: git.io [options] <url>"
        opts.version = Gitio::VERSION

        opts.on "-c", "--code CODE", "Generate a short url with the given code" do |code|
          options[:code] = code
        end
      end.parse!(arguments)

      error "You must specify an URL to shorten" if arguments.empty?

      [arguments.first, options]
    end

    def error(message, code=1)
      puts "git.io: #{message}"
      exit code
    end

  end
end
