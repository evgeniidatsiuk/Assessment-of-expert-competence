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

     @users.each do |x|
       pp "x #{x}"
       hash = {}
       x.each_with_index do |u,i|
          pp "u #{u} i #{i}"
         hash[:"e#{i+1}"] = u[:e]
         hash[:a] = u[:a]
         hash[:b] = u[:b]
         hash[:t] = u[:t]
         hash[:p] = u[:p]
       end
       pp "Go #{hash}"
      model1 << hash
      model2 << hash
     end

    @model_for_second_step = model1
    @model_for_third_step = model2
    pp @model_for_third_step

    @second_step = @model_for_second_step.each { |item| e.each { |e| pp e, item[:"#{e}"] } }

    @third_step = @model_for_third_step.each do |item|
      e.each { |e| item[:"#{e}"] = third_step(item[:"#{e}"], item[:a], item[:b]) }
      item[:d] = third_step(item[:t], item[:a], item[:b])
    end

    p '@third_step step'
    p @third_step

    # four step

    @z = []

    @third_step.each do |item|
      array = []
      max = largest_hash_key(item.reject { |x| %i[b p a t].include?(x) })
      min = least_hash_key(item.reject { |x| %i[b p a t].include?(x) })
      e.each do  |e|
        array << 1 - (item[:d] - item[:"#{e}"]).abs / [item[:d] - min[1], max[1] - item[:d]].max
      end
      @z << array
    end

    p 'four step'
    pp @z

    # five step

    @w = []
    sum = @model_for_third_step.inject(0) { |sum, item| sum + item[:p] }
    @third_step.each do |item|
      @w << item[:p] / sum.to_f
    end

    pp 'five step'
    pp @w

    @a = []
      sum = 0
      @n.times do |i|
        @n.times do |j|
          pp "i#{i} j #{j}"
          sum += @z[j][i] * @w[j]
          pp "SSS", sum
        end
        @a << { "e#{i + 1}": sum }
      end
       # @z[0][i] * @w[0] + @z[1][i] * @w[1] + @z[2][i] * @w[2] }


    pp 'Six step'

    pp @a

    # seven step

    @list = {}
    @a.each_with_index do |item, index|
      index += 1
      @list[index] = {e: item[:"e#{index}"]}
    end
    @list = @list.sort_by {|index,params|params[:e]}.reverse
    @max = @list.first.second[:e]
    @winer = @list.first.first
  end

  def upload
    # Setting.import(params[:file])
    # redirect_to root_path
  end

  private
  def check
    @users = where("result != '{}'").map(&:result)
    @n = Setting.first.experiment_count
    if @n != @users.count
      flash[:error] = "В налаштування: #{@n}, а пройшло тест: #{@users.count}."
      redirect_to setting_path
    end
  end
end
