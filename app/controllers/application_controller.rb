class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    render :text => "hi there"
  end
end
