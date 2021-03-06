require 'notify'

module ShoulderTap
  class Notification

    SUCCESS_ICON = "dialog-information.png"
    FAILURE_ICON = "dialog-error.png"
    DEFAULT_SENDER = 'ShoulderTap'

    def initialize(testsuite, sender = nil)
      @testsuite = testsuite
      @sender = sender.nil? ? DEFAULT_SENDER : sender
    end

    def send
      Notify.notify title, message, :app_name => 'ShoulderTap', :icon => icon
    end

    def title
      @sender + " - " + (@testsuite.success? ? "Passed" : "Failed")
    end

    def message
      success_ratio + ' tests passed'
    end

    def icon
      resources + (@testsuite.success? ? SUCCESS_ICON : FAILURE_ICON)
    end

    private

    def success_ratio
      "#{@testsuite.success_count}/#{@testsuite.size}"
    end

    def resources
      File.dirname(__FILE__) + '/resources/'
    end

  end

end
