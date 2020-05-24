class ModelsController < ApplicationController
  before_action :find_model, only: %i[show edit update]
  def index
    @models = Model.all
  end

  def show
  end

  def new
    @model = Model.new
    @model.questions.build

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @model = Model.create(model_params)
    @model.save
    redirect_to root_path
  end

  def edit

  end

  def update
    @model.update_attributes(model_params)
    redirect_to edit_model_path(@model.id)
  end

  private

  def find_model
    @model = Model.find params[:id]
  end

  def model_params
    params.require(:model).permit(:name, :a, :b, :t, :p, questions_attributes:[:id, :title, :_destroy, variants_attributes:[:id, :title, :value, :_destroy]])
  end
end
