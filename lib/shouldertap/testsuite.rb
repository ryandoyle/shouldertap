require 'shouldertap/test'

module ShoulderTap
  class Testsuite
    
    def initialize(tap_output)
      @tap_output = tap_output
    end

    def failed?
      result.any? {|test| test.failed? }
    end

    def success?
      ! failed?
    end

    def result
      @result ||= parse_tap
    end

    def size
      result.size
    end

    def failures
      result.select { |test| test.failed? }
    end

    def failed_count
      failures.size
    end

    def successes
      result.select { |test| test.success? }
    end

    def success_count 
      successes.size
    end

    private

    def parse_tap
      @tap_output.each_line.collect do |line|
        if line[/^ok/] or line[/^not ok/]
          Test.new line        
        end
      end.compact
    end

  end
end
