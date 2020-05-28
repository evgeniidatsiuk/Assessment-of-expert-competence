# frozen_string_literal: true

class UploadController < ApplicationController
  before_action :check
  include UploadHelper

  def index
    e = []
    models = Setting.first.model_count

    (1..@n).each do |i|
      e << "e#{i}"
    end

    model1 = []
    model2 = []

    models.times do |g|
      hash = {}
      @users.each_with_index do |x, i|
        hash[:"e#{i + 1}"] = x[g][:e]
        hash[:a] = x[g][:a]
        hash[:b] = x[g][:b]
        hash[:t] = x[g][:t]
        hash[:p] = x[g][:p]
      end
      model1 << hash
      model2 << hash
    end

    @model_for_third_step = model2

    @third_step = @model_for_third_step.each do |item|
      e.each { |e| item[:"#{e}"] = third_step(item[:"#{e}"], item[:a], item[:b]) }
      item[:d] = third_step(item[:t], item[:a], item[:b])
    end

    @z = []

    @third_step.each do |item|
      array = []
      max = largest_hash_key(item.reject { |x| %i[b p a t].include?(x) })
      min = least_hash_key(item.reject { |x| %i[b p a t].include?(x) })
      e.each do  |e|
        array << (1 - (item[:d] - item[:"#{e}"]).abs / [item[:d] - min[1], max[1] - item[:d]].max).floor(4)
      end
      @z << array
    end


    @w = []
    sum = @model_for_third_step.inject(0) { |sum, item| sum + item[:p] }
    @third_step.each do |item|
      @w << (item[:p] / sum.to_f).floor(4)
    end


    @a = []
    @n.times do |i|
      sum = 0
      models.times do |j|
        sum += (@z[j][i] * @w[j]).floor(4)
      end
      @a << { "e#{i + 1}": (sum).floor(4) }
    end

    @list = {}
    @a.each_with_index do |item, index|
      index += 1
      @list[index] = { e: item[:"e#{index}"] }
    end
    @list = @list.sort_by { |_index, params| params[:e] }.reverse
    @max = @list.first.second[:e]
    @winer = @list.first.first
  end

  def upload
    # Setting.import(params[:file])
    # redirect_to root_path
  end

  private

  def check
    @users = User.where("result != '{}'").map(&:result)
    @n = Setting.first.experiment_count
    m = @users.first.count
    m_count = Setting.first.model_count
    if @n != @users.count
      flash[:error] = "В налаштуваннях: #{@n}, а пройшло тест: #{@users.count}."
      redirect_to setting_path
    end
    if m != m_count
      flash[:error] = "В налаштуваннях: #{m_count}, а доступних моделей: #{m}."
      redirect_to setting_path
    end
  end
end
