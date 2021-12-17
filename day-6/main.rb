input = "3,4,3,1,2".split(",").map { |n| n.to_i }
input = open('./input.txt').readline.split(',').map { |n| n.to_i }

# part 1
# count = 0
# limit = 80
#
# while count < limit
#   puts "Day: #{count}"
#   index = 0
#   (index...input.length).each do |lf|
#     if input[lf] > 0
#       input[lf] -= 1
#     else
#       input[lf] = 6
#       input << 8
#     end
#   end
#   count += 1
# end
#
# puts input.count

# part 2 (lol brute force would take days)
count = 0
limit = 256

current_fish = {
  0 => input.count(0),
  1 => input.count(1),
  2 => input.count(2),
  3 => input.count(3),
  4 => input.count(4),
  5 => input.count(5),
  6 => input.count(6),
  7 => input.count(7),
  8 => input.count(8),
}

next_generation = {}

while count < limit
  next_generation = {
    0 => current_fish[1],
    1 => current_fish[2],
    2 => current_fish[3],
    3 => current_fish[4],
    4 => current_fish[5],
    5 => current_fish[6],
    6 => current_fish[7],
    7 => current_fish[8],
    8 => current_fish[0],
  }

  if current_fish[0] > 0
    next_generation[6] += current_fish[0]
  end

  current_fish = next_generation

  count += 1
end

total = 0
current_fish.each do |k,v|
  total += v
end

puts "Total Fish: #{total}"