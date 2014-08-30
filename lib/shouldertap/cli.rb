require 'optparse'

require 'shouldertap/testsuite'
require 'shouldertap/notification'

module ShoulderTap
  class CLI

    def initialize(arguments, tap_output)
      @arguments = arguments
      @tap_output = tap_output
    end

    def run
      testsuite = ShoulderTap::Testsuite.new @tap_output
      ShoulderTap::Notification.new(testsuite, options[:name]).send
    end

    private

    def options
      @options ||= parse_options
    end
 
    def parse_options
      options = {}
      parser = OptionParser.new do |opts|
        opts.banner = "Usage: shouldertap [-h] [-r NAME] < TAP_OUTPUT"
        opts.on '-h', '--help', 'Print help' do 
          STDERR.puts opts
          exit 1
        end
        opts.on '-n', '--name NAME', 'Name of the test that ShoulderTap will report as. Defaults to "ShoulderTap"' do |n|
          options[:name] = n
        end
      end
      parser.parse! @arguments
      options
    end

  end
end


