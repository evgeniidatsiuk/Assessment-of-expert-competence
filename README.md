Індивідуальна робота.
https://docs.google.com/document/d/10PPFuR7W0K42qPWckhoeGcJeM17sBt4s/edit#

Консольна версія проекту:

```ruby

def second_step(s = 0.0, a = 0.0, b = 0.0)
  if a < s && s <= (a + b) / 2
    one = (s - a).to_f
    two = (b - a).to_f
    final = (one / two).to_f
    final **= 2
    return 2 * final
  end
  0
end

def third_step(t = 0.0, a = 0.0, b = 0.0)
  return 0 if t <= a

  if a < t && t <= (a + b) / 2
    one = (t - a).to_f
    two = (b - a).to_f
    final = (one / two).to_f
    final **= 2
    return 2 * final
  end

  if (a + b) / 2 < t && t < b
    one = (b - t).to_f
    two = (b - a).to_f
    final = (one / two).to_f
    final **= 2
    return 1 - 2 * final
  end

  1 if t >= b
end

def largest_hash_key(hash)
  hash.max_by { |_k, v| v }
end

def least_hash_key(hash)
  hash.min_by { |_k, v| v }
end

n = 5
e = []
models = 3
(1..n).each do |i|
  e << "e#{i}"
end

model_for_second_step = [
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

model_for_third_step = [
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
```
# second step
```ruby
second_step = model_for_second_step.each { |item| e.each { |e| item[:"#{e}"] = second_step(item[:"#{e}"], item[:a], item[:b]) } }

third_step = model_for_third_step.each do |item|
  e.each { |e| item[:"#{e}"] = third_step(item[:"#{e}"], item[:a], item[:b]) }
  item[:d] = third_step(item[:t], item[:a], item[:b])
end

p 'third_step step'
p third_step
```
# four step
```ruby
z = []

third_step.each do |item|
  array = []
  max = largest_hash_key(item.reject { |x| %i[b p a t].include?(x) })
  min = least_hash_key(item.reject { |x| %i[b p a t].include?(x) })
  e.each do  |e|
    array << 1 - (item[:d] - item[:"#{e}"]).abs / [item[:d] - min[1], max[1] - item[:d]].max
  end
  z << array
end

p 'four step'
pp z
```
# five step
```ruby

w = []
sum = model_for_third_step.inject(0) { |sum, item| sum + item[:p] }
third_step.each do |item|
  w << item[:p] / sum.to_f
end

pp 'five step'
pp w
```
# six step
```ruby
a = []
n.times do |i|
  p i
  a << { "e#{i + 1}": z[0][i] * w[0] + z[1][i] * w[1] + z[2][i] * w[2] }
end

pp 'Six step'

pp a
```
# seven step
```ruby
max = 0
a.each_with_index do |item, index|
   index += 1
  if item[:"e#{index}"] > max
    max = item[:"e#{index}"]
  end
end

pp max

```
