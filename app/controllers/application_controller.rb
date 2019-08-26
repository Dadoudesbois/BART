class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private

  helper_method :is_navbar_white?

  def is_navbar_white?
    false
  end
end
