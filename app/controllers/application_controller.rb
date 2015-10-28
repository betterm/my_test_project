class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def current_week
    date = Date.today.beginning_of_week
    return (date..date + 6.days).to_a
  end
end
