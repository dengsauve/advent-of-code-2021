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

# obtain the oxygen generator rating
numbers = input.clone
limit = numbers[0].length
index = 0

while index < limit
  count_ones = 0
  count_zeroes = 0

  numbers.each do |i|
    case i[index]
    when '1'
      count_ones += 1
    when '0'
      count_zeroes += 1
    else
      raise('bad input')
    end
  end

  if count_ones >= count_zeroes
    # save nums with first bit as 1s
    numbers.select! { |num| num[index] == '1' }
  else
    # save nums with first bit as 0s
    numbers.select! { |num| num[index] == '0' }
  end

  break if numbers.length == 1

  index += 1
end

oxygen_generator_rating = numbers[0].join.to_i(2)

# obtain the CO2 scrubber rating
numbers = input.clone
limit = numbers[0].length
index = 0

while index < limit
  count_ones = 0
  count_zeroes = 0

  numbers.each do |i|
    case i[index]
    when '1'
      count_ones += 1
    when '0'
      count_zeroes += 1
    else
      raise('bad input')
    end
  end

  if count_zeroes <= count_ones
    # save nums with first bit as 0s
    numbers.select! { |num| num[index] == '0' }
  else
    # save nums with first bit as 1s
    numbers.select! { |num| num[index] == '1' }
  end

  break if numbers.length == 1

  index += 1
end

co2_scrubber_rating = numbers[0].join.to_i(2)

life_support_rating = oxygen_generator_rating * co2_scrubber_rating

puts "Part 2:", "Life Support: #{life_support_rating}"