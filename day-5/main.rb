input = open('./input.txt').readlines.map do |l|
  l = l.strip.split(' -> ')
       .map { |coords| coords.split(',').map { |coord| coord.to_i} }

end

vents = {}

input.each do | coords |
  if coords[0][0] == coords[1][0] or coords[0][1] == coords[1][1]
    (coords[0][0]..coords[1][0]).each do |x|
      (coords[0][1]..coords[1][1]).each do |y|
        if vents.key?([x,y])
          vents[[x,y]] += 1
        else
          vents[[x,y]] = 1
        end
      end
    end
  end
end

#2012 too low
puts vents.select { |k, v| v > 1 }.count