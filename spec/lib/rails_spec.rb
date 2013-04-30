require "spec_helper"

describe BrowserConsole::Rails do
  it "should monkey patch the application controller" do
    ApplicationController.should respond_to(:enable_browser_console)
  end
end

describe SampleController, :type => :controller do
  render_views

  it "should capture the binding for browser console when enabled" do
    SampleController.any_instance.should_receive(:capture_binding_for_browser_console)
    get :index
  end

  it "should not capture the binding for browser console when not enabled" do
    SampleController.any_instance.should_not_receive(:capture_binding_for_browser_console)
    get :show
  end

  it "should render successfully" do
    get :index
    response.should be_success
  end

  it "should include links to the javascript and stylesheet assets when enabled" do
    get :index
    response.body.should include('window.BrowserConsole')
    response.body.should match(/script.*browser_console.*\.js/)
    response.body.should match(/link.*browser_console.*\.css/)
  end

  it "should not include links to the assets when not enabled" do
    get :show
    response.body.should_not include('window.BrowserConsole')
    response.body.should_not match(/script.*browser_console.*\.js/)
    response.body.should_not match(/link.*browser_console.*\.css/)
  end
end