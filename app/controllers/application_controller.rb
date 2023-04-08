class ApplicationController < ActionController::Base
  def self.current_user
    User.first
  end
end
