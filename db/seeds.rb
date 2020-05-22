Setting.create(experiment_count: 5, model_count: 3)


m1 =  Model.create(name: 'Самооцінка', a: 55, b: 120, t: 100, p: 6)
m2 =  Model.create(name: 'Модель спеціальних вмінь і навичок', a: 60, b: 220, t: 190,p: 10)
m3 =  Model.create(name: 'Модель психофізіологічних якостей особистості', a: 20, b: 180, t: 140, p: 9)

q1 = Question.create(title: 'Досвід роботи', model_id: m1.id)

Variant.create(question_id: q1.id, title: 'До 3 років', value: 10)
Variant.create(question_id: q1.id, title: 'З 3 до 5 років', value: 15)
Variant.create(question_id: q1.id, title: 'З 5 до 10 років', value: 20)
Variant.create(question_id: q1.id, title: 'Більше 10 років', value: 30)

q2 = Question.create(title: 'Посада', model_id: m1.id)

Variant.create(question_id: q2.id, title: 'Виконавець', value: 20)
Variant.create(question_id: q2.id, title: 'Керівник середньої ланки', value: 22)
Variant.create(question_id: q2.id, title: 'Керівник вищої ланки', value: 25)
Variant.create(question_id: q2.id, title: 'Топ менеджер', value: 30)

q3 = Question.create(title: 'Теоретичний рівень підготовки', model_id: m1.id)

Variant.create(question_id: q3.id, title: 'Бакалавр', value: 15)
Variant.create(question_id: q3.id, title: 'Магістр', value: 20)
Variant.create(question_id: q3.id, title: 'Кандидат наук', value: 25)
Variant.create(question_id: q3.id, title: 'Доктор наук', value: 30)

q4 = Question.create(title: 'Імідж в ділових колах', model_id: m1.id)

Variant.create(question_id: q4.id, title: 'Маловідома в ділових колах людина', value: 10)
Variant.create(question_id: q4.id, title: 'Людина, визнана фахівцем в окремій галузі ', value: 20)
Variant.create(question_id: q4.id, title: 'Людина, визнана фахівцем у кількох галузях ', value: 25)
Variant.create(question_id: q4.id, title: 'Широковизнанна в ділових колах людина', value: 30)

q5 = Question.create(title: 'Рівень знань API-driven Single Page Apps', model_id: m2.id)

Variant.create(question_id: q5.id, title: 'Низький', value: 10)
Variant.create(question_id: q5.id, title: 'Середній', value: 15)
Variant.create(question_id: q5.id, title: 'Вище середнього', value: 30)
Variant.create(question_id: q5.id, title: 'Високий', value: 40)

q6 = Question.create(title: 'Рівень знань MySQL', model_id: m2.id)

Variant.create(question_id: q6.id, title: 'Низький', value: 15)
Variant.create(question_id: q6.id, title: 'Середній', value: 20)
Variant.create(question_id: q6.id, title: 'Вище середнього', value: 35)
Variant.create(question_id: q6.id, title: 'Високий', value: 40)

q7 = Question.create(title: 'Досвід JavaScript', model_id: m2.id)

Variant.create(question_id: q7.id, title: 'Низький', value: 15)
Variant.create(question_id: q7.id, title: 'Середній', value: 20)
Variant.create(question_id: q7.id, title: 'Вище середнього', value: 25)
Variant.create(question_id: q7.id, title: 'Високий', value: 40)

q8 = Question.create(title: 'Рівень знань C# і/або .NET', model_id: m2.id)

Variant.create(question_id: q8.id, title: 'Низький', value: 10)
Variant.create(question_id: q8.id, title: 'Середній', value: 20)
Variant.create(question_id: q8.id, title: 'Вище середнього', value: 35)
Variant.create(question_id: q8.id, title: 'Високий', value: 50)

q9 = Question.create(title: 'Рівень знань Python', model_id: m2.id)

Variant.create(question_id: q9.id, title: 'Низький', value: 10)
Variant.create(question_id: q9.id, title: 'Середній', value: 20)
Variant.create(question_id: q9.id, title: 'Вище середнього', value: 40)
Variant.create(question_id: q9.id, title: 'Високий', value: 50)

q10 = Question.create(title: 'Коли між людьми відбувається конфлікт на ґрунті ідей, я віддаю перевагу тій стороні, що', model_id: m3.id)

Variant.create(question_id: q10.id, title: 'приймає, визнає конфлікт і намагається висловити його відкрито', value: 0)
Variant.create(question_id: q10.id, title: 'більше за інших зачіпає мої власні цінності та ідеали', value: 15)
Variant.create(question_id: q10.id, title: 'краще за інших відображає мої особисті погляди і досвід', value: 20)
Variant.create(question_id: q10.id, title: 'викладає аргументи найбільш коротко і переконливо', value: 40)

q11 = Question.create(title: 'Коли я починаю працювати над проектом у складі групи, найважливіше для мене', model_id: m3.id)

Variant.create(question_id: q11.id, title: 'зрозуміти мету і значення цього проекту', value: 5)
Variant.create(question_id: q11.id, title: 'розкрити мету і цінності учасників робочої групи', value: 22)
Variant.create(question_id: q11.id, title: 'визначити, як ми збираємося розробляти даний проект', value: 25)
Variant.create(question_id: q11.id, title: 'щоб робота над проектом була організована і зрушила з місця', value: 30)

q12 = Question.create(title: 'Говорячи в цілому, я засвоюю нові ідеї найкраще, коли можу', model_id: m3.id)

Variant.create(question_id: q12.id, title: 'застосувати їх до конкретних ситуацій', value: 5)
Variant.create(question_id: q12.id, title: 'зосередитися на них і ретельно їх проаналізувати', value: 10)
Variant.create(question_id: q12.id, title: 'зрозуміти, наскільки вони подібні до звичних ідей', value: 25)
Variant.create(question_id: q12.id, title: 'протиставити їх іншим ідеям', value: 30)

q13 = Question.create(title: 'Коли я читаю звіт про роботу, я звертаю найбільше уваги на', model_id: m3.id)

Variant.create(question_id: q13.id, title: 'близькість висновків до мого особистого досвіду', value: 5)
Variant.create(question_id: q13.id, title: 'можливість виконання даних рекомендацій', value: 10)
Variant.create(question_id: q13.id, title: 'надійність і обґрунтованість результатів фактичними даними', value: 30)
Variant.create(question_id: q13.id, title: 'розуміння автором цілей та завдань роботи', value: 40)

q14 = Question.create(title: 'Коли переді мною поставлено завдання, перше, про що я хочу довідатися - це', model_id: m3.id)

Variant.create(question_id: q14.id, title: 'який найкращий метод для вирішення даного завдання', value: 5)
Variant.create(question_id: q14.id, title: 'кому і коли потрібно, щоб це завдання було вирішене', value: 15)
Variant.create(question_id: q14.id, title: 'чому це завдання варто вирішувати', value: 30)
Variant.create(question_id: q14.id, title: 'яка пряма, негайна користь від вирішення даного завдання', value: 40)
