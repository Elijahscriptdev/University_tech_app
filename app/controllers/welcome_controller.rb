class WelcomeController < ApplicationController
  skip_before_action :require_user
  def home
  end
end
