class ApplicationController < ActionController::Base

  def current_user
    User.find_by_id cookies[:current_user]
  end
end
