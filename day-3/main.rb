input = open('./input.txt').readlines.map!{ |i| i = i.strip.split("") }

# part 1
gamma = ''
epsilon = ''

limit = input[0].length
index = 0

while index < limit
  count_zeroes = 0
  count_ones = 0

  input.each do |i|
    case i[index]
    when "0"
      count_zeroes += 1
    when "1"
      count_ones += 1
    else
      raise "bad binary input"
    end
  end

  if count_zeroes > count_ones
    gamma += '0'
    epsilon += '1'
  else
    gamma += '1'
    epsilon += '0'
  end

  index += 1
end

# puts gamma, epsilon

gamma_decimal = gamma.to_i(2)
epsilon_decimal = epsilon.to_i(2)
power_consumption = gamma_decimal * epsilon_decimal

puts "Part 1: ", "Gamma: #{gamma_decimal}", "Epsilon: #{epsilon_decimal}",
     "Solution: #{power_consumption}"

# part 2
