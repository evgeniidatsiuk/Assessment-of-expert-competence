# frozen_string_literal: true

class SettingsController < ApplicationController
  before_action :setting

  def show; end

  def update
    setting.update_attributes(setting_params)
    render 'show'
  end

  def reset
    User.delete_all
    flash[:success] = 'Рейтинг успішно очищено!'
    redirect_to root_path
  end

  private

  def setting
    @settings = Setting.first
  end

  def setting_params
    params.require(:setting).permit(:experiment_count, :model_count)
  end
end
