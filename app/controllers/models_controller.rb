class ModelsController < ApplicationController
  def index
    @models = Model.all
  end

  def show
    @model = Model.find params[:id]
  end

  def new
    @model = Model.new
    @questions = []
    count = params[:count].to_i
    count = 2 if count == 0
    count.times do
    @questions <<  @model.questions.build()
    @questions.last.variants.build()
    end

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

  private

  def model_params
    params.require(:model).permit(:name, questions_attributes:[:name,:_destroy,variants_attributes:[:name,:value ,:_destroy]])
  end
end
