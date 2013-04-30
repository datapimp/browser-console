class SampleController < ApplicationController
  enable_browser_console :only => :index

  def index
    @ivar = :index
    head :ok
  end

  def show
    @ivar = :show
    head :ok
  end
end
