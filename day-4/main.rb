require 'colorize'

input = open('./input.txt').readlines

# setup
# read instructions
instructions = input.shift.split(',').map { |n| n.to_i }
input.shift

# part 1
cards = []
new_card = []
input.each_with_index do |row, i|
  unless (i + 1) % 6 == 0
    new_card << row.strip.split(' ').map { |n| n = [n.to_i, false] }
  else
    cards << new_card
    new_card = []
  end
end

# puts cards.inspect
# puts instructions

def check_for_bingo(card)
  card.each do |row|
    if row.select { |spot| spot[1] == true }.length == 5
      return true
    end
  end
  card.transpose.each do |col|
    if col.select { |spot| spot[1] == true }.length == 5
      return true
    end
  end

  false
end

def print_bingo_card(card)
  unmarked_total = 0
  card.each do |row|
    row.each do |spot|
      if spot[1]
        print (spot[0].to_s.ljust(2) + " ").light_yellow
      else
        unmarked_total += spot[0]
        print (spot[0].to_s.ljust(2) + " ").light_black
      end
    end
    puts
  end
  unmarked_total
end

is_winner = false

instructions.each_with_index do |inst, ii|
  # Play the cards
  cards.each do |card|
    card.each do |row|
      row.map { |num_val| num_val[1] = true if num_val[0] == inst }
    end
  end

  # Check the cards for rows
  cards.each do |card|
    winner = check_for_bingo(card)
    if winner
      total = print_bingo_card(card)
      puts "\nScore:", total * inst
      is_winner = true
      break
    end
  end

  break if is_winner
end

# Part 2
cards = []
new_card = []
input.each_with_index do |row, i|
  unless (i + 1) % 6 == 0
    new_card << row.strip.split(' ').map { |n| n = [n.to_i, false] }
  else
    cards << new_card
    new_card = []
  end
end

instructions.each_with_index do |inst, ii|
  # Play the cards
  cards.each do |card|
    card.each do |row|
      row.map { |num_val| num_val[1] = true if num_val[0] == inst }
    end
  end

  # Check the cards for rows
  if cards.length > 1
    cards.delete_if { |card| check_for_bingo(card) }
  else
    # print_bingo_card(cards[0])
    last_winner = check_for_bingo(cards[0])
    if last_winner
      total = print_bingo_card(cards[0])
      puts "\nScore:", total * inst
      break
    end
  end

end