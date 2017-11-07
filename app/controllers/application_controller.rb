class ApplicationController < ActionController::Base
  include CategoryOptions
  protect_from_forgery with: :exception
  before_action :authenticate_user!

end
