input = input = open('./input.txt').readlines
input.map!{ |i| i = i.split(" ") }

# part 1
horizontal = 0
depth = 0

input.each do |command|
  magnitude = command[1].to_i
  case command[0]
  when "forward"
    horizontal += magnitude
  when "down"
    depth += magnitude
  when "up"
    depth -= magnitude
  else
    raise("Invalid Command")
  end
end

puts "Part 1:", "Horizontal: #{horizontal}", "Depth: #{depth}", "Solution: #{horizontal * depth}"

# part 2

horizontal = 0
depth = 0
aim = 0

input.each do |command|
  magnitude = command[1].to_i
  case command[0]
  when "forward"
    horizontal += magnitude
    depth += ( aim * magnitude )
  when "down"
    aim += magnitude
  when "up"
    aim -= magnitude
  else
    raise("Invalid Command")
  end
end

puts "\n\nPart 2:", "Aim: #{aim}", "Horizontal: #{horizontal}", "Depth: #{depth}", "Solution: #{horizontal * depth}"