class SampleController < ApplicationController
  enable_browser_console :only => :index

  def index
    @ivar = :index
  end

  def show
    @ivar = :show
  end
end
