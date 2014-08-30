module ShoulderTap

  class Test

    def initialize(tap_line)
      @tap_line = tap_line
      parse_tap_line
    end

    attr_reader :number, :message

    def success?
      @success
    end

    def failed?
      ! @success
    end
    
    private

    def parse_tap_line
      @success = @tap_line[/^ok \d/] ? true : false
      @number  = @tap_line[/ok (\d)/,1].to_i
      @message = @tap_line[/ok \d (.*)/, 1]
    end


  end

end

