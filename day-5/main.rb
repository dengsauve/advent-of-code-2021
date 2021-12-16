input = open('./input.txt').readlines.map do |l|
  l = l.strip.split(' -> ')
       .map { |coords| coords.split(',').map { |coord| coord.to_i} }
end

# input = "0,9 -> 5,9
# 8,0 -> 0,8
# 9,4 -> 3,4
# 2,2 -> 2,1
# 7,0 -> 7,4
# 6,4 -> 2,0
# 0,9 -> 2,9
# 3,4 -> 1,4
# 0,0 -> 8,8
# 5,5 -> 8,2".split("\n").map do |l|
#   l = l.strip.split(' -> ')
#        .map { |coords| coords.split(',').map { |coord| coord.to_i} }
# end

vents = {}

# part 1
# input.each do | coords |
#   x1, x2 = coords[0][0], coords[1][0]
#   y1, y2 = coords[0][1], coords[1][1]
#   if x1 == x2 or y1 == y2
#     x_range = ([x1,x2].min..[x1,x2].max)
#     y_range = ([y1,y2].min..[y1,y2].max)
#     (x_range.min).upto(x_range.max).each do |x|
#       (y_range.min).upto(y_range.max).each do |y|
#         if vents.key?([x,y])
#           vents[[x,y]] += 1
#         else
#           vents[[x,y]] = 1
#         end
#       end
#     end
#   end
# end
#
# #2012 too low, 7380 correct
# puts vents.select { |k, v| v > 1 }.count

# part 2

def is_diagonal(x1,x2,y1,y2)
  (y1-x1).abs == (y2-x2).abs or (x1-x2).abs == (y1-y2).abs
end

input.each do | coords |
  x1, x2 = coords[0][0], coords[1][0]
  y1, y2 = coords[0][1], coords[1][1]

  if x1 == x2 or y1 == y2
    x_range = ([x1,x2].min..[x1,x2].max)
    y_range = ([y1,y2].min..[y1,y2].max)
    x_range.each do |x|
      y_range.each do |y|
        if vents.key?([x,y])
          vents[[x,y]] += 1
        else
          vents[[x,y]] = 1
        end
      end
    end
  elsif is_diagonal(x1,x2,y1,y2)
    puts "diag"
    index = 0
    if x1 < x2
      x_range = (x1..x2).to_a
    else
      x_range = (x2..x1).to_a.reverse
    end
    if y1 < y2
      y_range = (y1..y2).to_a
    else
      y_range = (y2..y1).to_a.reverse
    end
    puts x_range.inspect, y_range.inspect
    throw('bad range') if x_range.count != y_range.count
    while index < x_range.count # watch out for nil, nil
      x = x_range[index]
      y = y_range[index]
      puts [x,y].inspect
      if vents.key?([x,y])
        vents[[x,y]] += 1
      else
        vents[[x,y]] = 1
      end
      index += 1
    end
    puts"\n\n"
  end
end

#21373 correct
puts vents
puts vents.select { |k, v| v > 1 }.count