require "browser_console/rails/engine"

module BrowserConsole
  module Rails
    def self.included(base)
      base.extend(ClassMethods)
      base.send(:protected, :capture_binding_for_browser_console, :browser_console_enabled?)
      base.send(:helper_method, :browser_console_enabled?)
    end

    def capture_binding_for_browser_console
      @browser_console_enabled = true
      BrowserConsole.capture_binding(self)
    end

    def browser_console_enabled?
      !!@browser_console_enabled
    end

    module ClassMethods
      def enable_browser_console *args
        options = args.extract_options!
        before_filter :capture_binding_for_browser_console, :only => options[:only]
      end
    end
  end
end