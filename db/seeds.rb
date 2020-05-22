Setting.create(experiment_count: 5, model_count: 3)

m1 = Model.create(name: 'name 3')

q1 = m1.questions.create(name: 'name ')

v1 = q1.variants.create(name: 'name', value: 50)
q1.variants.create(name: 'name 1', value: 75)
q1.variants.create(name: 'name 2', value: 120)
q1.variants.create(name: 'name 3', value: 100)
