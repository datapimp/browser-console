require "spec_helper"

describe BrowserConsole::Rails do
  it "should monkey patch the application controller" do
    ApplicationController.should respond_to(:enable_browser_console)
  end
end

describe SampleController, :type => :controller do
  it "should return a successful response" do
    get :index
    response.should be_success
  end

  it "should capture the binding for browser console when enabled" do
    SampleController.any_instance.should_receive(:capture_binding_for_browser_console)
    get :index
  end

  it "should not capture the binding for browser console when not enabled" do
    SampleController.any_instance.should_not_receive(:capture_binding_for_browser_console)
    get :show
  end
end