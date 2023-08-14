class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :redirect_if_login, only: [:index]

  def index
  end

  def show
    @user = current_user
  end

  private
  def redirect_if_login
    if user_signed_in?
      redirect_to rooms_show_path
    end
  end
end
