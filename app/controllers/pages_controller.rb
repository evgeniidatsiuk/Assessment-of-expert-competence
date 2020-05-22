class PagesController < ApplicationController
  before_action :current_user, only: [:index]

  def index
    if current_user.nil?
      @user = User.new
    else
      redirect_to test_index_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      cookies.permanent[:current_user] = @user.id
      redirect_to test_index_path
    else
      render 'index'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name)
  end
end
