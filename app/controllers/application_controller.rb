class ApplicationController < ActionController::Base
  def self.current_user(id)
    User.find_by(id:)
  end
end
