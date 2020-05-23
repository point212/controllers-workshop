class Web::User::ApplicationController < Web::ApplicationController

  def current_user
    User.first
  end
end
