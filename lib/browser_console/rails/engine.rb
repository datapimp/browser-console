require "browser_console/rack_application"

module BrowserConsole
  module Rails
    VERSION = BrowserConsole::Version

    class Engine < ::Rails::Engine
      endpoint BrowserConsole::RackApplication

      initializer "browser_console.initializer" do |app|
        ApplicationController.send(:include, BrowserConsole::Rails)
      end
    end
  end
end