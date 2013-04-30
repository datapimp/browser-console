Rails.application.routes.draw do
  mount BrowserConsole::Rails::Engine => "/browser_console"

  root :to => "sample#index"
  get "/show", :to => "sample#show"
end
