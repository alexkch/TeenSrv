class WelcomeController < ApplicationController
  def index
  end
  skip_before_action :auth_user
end
