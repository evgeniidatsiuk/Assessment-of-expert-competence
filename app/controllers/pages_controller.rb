class PagesController < ApplicationController

  def index
      @user = User.new
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
