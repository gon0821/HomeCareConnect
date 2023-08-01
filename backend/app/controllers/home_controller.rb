class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
  end

  def show
    @user = current_user
  end
end
