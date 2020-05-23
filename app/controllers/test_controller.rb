class TestController < ApplicationController
  include UploadHelper

  def index
    @models = Model.all
  end

  def calculate

   ogo = test_params[:model].to_h
    models = []
    result = []
    ogo.each do |x|
      pp x[0] # we can find model by id
      model = Model.find_by_id x[0]
      f = {}
      res = []

      x[1][:question].each do |s|
        res.push(s[1].to_i)
      end

      f[:e] = res.sum
      f[:a] = model.a
      f[:b] = model.b
      f[:t] = model.t
      f[:p] = model.p
      models << f
    end

    session[:models] = []
    session[:models] = models

    current_user.update_attributes(result: models)
    pp current_user

    redirect_to result_test_index_path
  end

  def result
    models = session[:models]
    pp "sss"
    pp models
    n = models.size

    e = []


    (1..n).each do |i|
      e << "e#{i}"
    end


    @model_for_second_step = models

    @model_for_third_step = models

    # second step

    @second_step = @model_for_second_step.each { |item| item['e'] = second_step(item['e'], item['a'], item['b']) }

    p '@second_step step'
    p @second_step

    @third_step = @model_for_third_step.each do |item|
      item['e'] = third_step(item['e'], item['a'], item['b'])
      item['d'] = third_step(item['t'], item['a'], item['b'])
    end

    p '@third_step step'
    p @third_step

    # four step

    @z = []

    @third_step.each do |item|
      array = []
      max = largest_hash_key(item.reject { |x| %i[b p a t].include?(x) })
      min = least_hash_key(item.reject { |x| %i[b p a t].include?(x) })
        array << 1 - (item['d'] - item['e']).abs / [item['d'] - min[1], max[1] - item['d']].max
      @z << array
    end

    p 'four step'
    pp @z

    # five step

    @w = []
    sum = @model_for_third_step.inject(0) { |sum, item| sum + item['p'] }
    @third_step.each do |item|
      @w << item['p'] / sum.to_f
    end

    pp 'five step'
    pp @w
    sum = 0
    n.times do |i|
      sum += @z[i][0] * @w[0]
    end

    @max = sum
    @winer = 'You'
   end


   def upload
     n = 5
    e = []
    models = 3
    (1..n).each do |i|
      e << "e#{i}"
    end

    @model_for_second_step = [
      {
        e1: 70,
        e2: 90,
        e3: 110,
        e4: 85,
        e5: 115,
        a: 55,
        b: 120,
        t: 100,
        p: 6
      },
      {
        e1: 200,
        e2: 110,
        e3: 180,
        e4: 200,
        e5: 150,
        a: 60,
        b: 220,
        t: 190,
        p: 10
      },
      {
        e1: 90,
        e2: 120,
        e3: 150,
        e4: 80,
        e5: 170,
        a: 20,
        b: 180,
        t: 140,
        p: 9
      }
    ]
    @test = []

    @users = User.all

    @model_for_third_step = [
      {
        e1: 70,
        e2: 90,
        e3: 110,
        e4: 85,
        e5: 115,
        a: 55,
        b: 120,
        t: 100,
        p: 6
      },
      {
        e1: 200,
        e2: 110,
        e3: 180,
        e4: 200,
        e5: 150,
        a: 60,
        b: 220,
        t: 190,
        p: 10
      },
      {
        e1: 90,
        e2: 120,
        e3: 150,
        e4: 80,
        e5: 170,
        a: 20,
        b: 180,
        t: 140,
        p: 9
      }
    ]

    # second step

    @second_step = @model_for_second_step.each { |item| e.each { |e| item[:"#{e}"] = second_step(item[:"#{e}"], item[:a], item[:b]) } }

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
    # six step
    @a = []
    n.times do |i|
      p i
      @a << { "e#{i + 1}": @z[0][i] * @w[0] + @z[1][i] * @w[1] + @z[2][i] * @w[2] }
    end

    pp 'Six step'

    pp @a

    # seven step

    @list = {}
    @a.each_with_index do |item, index|
      index += 1
      @list[index] = {e: item[:"e#{index}"]}
    end
    pp @list = @list.sort_by {|index,params|params[:e]}.reverse
    @max = @list.first.second[:e]
    @winer = @list.first.first
   end

  private

  def test_params
    params.require(:test).permit!
  end
end
