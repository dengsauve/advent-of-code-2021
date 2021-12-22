input = open('./input.txt').readlines
                           .map{ |line| line.chomp.split('')
                                            .map { |num| num.to_i }
                           }

# input = "2199943210
# 3987894921
# 9856789892
# 8767896789
# 9899965678".split("\n")
#            .map{ |line|
#              line.split('')
#                  .map { |num|
#                    num.to_i
#                  }
#            }

# part 1
low_points = []

input.each_with_index do |row, y|
  row.each_with_index do |point, x|
    # puts "debug: #{[y,x].inspect} - #{point}"
    is_low = true
    # check left
    if x > 0
      is_low = false if input[y][x-1] <= point
    end
    # check right
    if x < row.length - 1
      is_low = false if input[y][x+1] <= point
    end
    # check up
    if y > 0
      is_low = false if input[y-1][x] <= point
    end
    # check down
    if y < input.length - 1
      is_low = false if input[y+1][x] <= point
    end
    if is_low
      # [point, collection of basin coords[], scanned coords[]]
      low_points << [point, [[y, x]], []]
    end
  end
end

total = 0
low_points.each do |p|
  total += (1 + p[0])
end

puts "Part 1:", "Total: #{total}"

# part 2
low_points.each do |p|
  point = p[0]
  while p[1].count > 0
    y, x = p[1].pop
    # check left
    if x > 0
      if input[y][x-1] > point and input[y][x-1] != 9
        unless p[2].include?([y,x-1])
          p[1] << [y, x-1]
        end
      end
    end
    # check right
    if x < input[y].length - 1
      if input[y][x+1] > point and input[y][x+1] != 9
        unless p[2].include?([y,x+1])
          p[1] << [y, x+1]
        end
      end
    end
    # check up
    if y > 0
      if input[y-1][x] > point and input[y-1][x] != 9
        unless p[2].include?([y-1,x])
          p[1] << [y-1, x]
        end
      end
    end
    # check down
    if y < input.length - 1
      if input[y+1][x] > point and input[y+1][x] != 9
        unless p[2].include?([y+1,x])
          p[1] << [y+1, x]
        end
      end
    end

    p[2] << [y, x]
    p[1].uniq!
  end
end

low_points.sort_by! { |lp| lp[2].count} .reverse!

product = 1
low_points[0..2].each do |lp|
  product *= lp[2].count
end

puts "Part 2:", "Product of 3 largest basins: #{product}"