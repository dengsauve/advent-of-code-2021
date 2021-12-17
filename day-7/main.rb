input = "16,1,2,0,4,2,7,1,2,14".split(',').map{|n| n.to_i}
input = open('./input.txt').readline.split(',').map{|n| n.to_i}

# find the median
input.sort!
center = input.count / 2
median = input[center]

puts median

fuel = 0
input.each do |pos|
  fuel += (median - pos).abs
end

puts "Part 1:\nFuel: #{fuel}"

# even though my average was num.56, rounding down was cheaper!
# Need to compoare
average_1 = (input.sum / input.count.to_f).floor
average_2 = (input.sum / input.count.to_f).ceil
fuel_1 = 0
fuel_2 = 0
input.each do |pos|
  (1..(average_1 - pos).abs).each do |move|
    fuel_1 += move
  end
  (1..(average_2 - pos).abs).each do |move|
    fuel_2 += move
  end
end

# 89647716 too high
puts "Part 2:\nFuel: #{[fuel_1, fuel_2].min}"



