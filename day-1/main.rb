input = open('./input.txt').readlines.map!{ |i| i = i.to_i}

previous = 0
number_of_increases = 0
input.each_with_index do | readout, i |
  unless i == 0
    if readout > previous
      number_of_increases += 1
    end
  end
  previous = readout
end

puts number_of_increases

# 1476 too low, 1477 was correct (forgot to map to_i)

counter = 0
window_increases = 0
while counter < input.length - 3 do
  window_a = input[counter..counter + 2].sum
  window_b = input[counter + 1..counter + 3].sum
  window_increases += 1 if window_a < window_b
  counter += 1
end

puts "counter: #{counter}", window_increases