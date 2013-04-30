module BrowserConsoleHelper
  def include_browser_console_assets
    render :partial => "browser_console/setup"
  end

end