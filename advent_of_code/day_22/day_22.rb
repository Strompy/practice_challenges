data = File.read("input.txt").split("\n\n")
deck_1 = []
deck_2 = []
data[0].split("\n").each do |line|
  next if line.include?('Player')
  deck_1 << line.to_i
end
data[1].split("\n").each do |line|
  next if line.include?('Player')
  deck_2 << line.to_i
end

## Part 1 ##

class Player
  attr_reader :deck
  def initialize(deck)
    @deck = deck
  end
end

def winner(player_1, player_2)
  player_1.deck.first > player_2.deck.first ? player_1 : player_2
end

def round(player_1, player_2)
  winner = winner(player_1, player_2)
  loser = player_1 if winner == player_2
  loser = player_2 if winner == player_1
  card_1 = winner.deck.shift
  card_2 = loser.deck.shift
  winner.deck.push(card_1, card_2)
end

def find_winner(player_1, player_2)
  player_1.deck.empty? ? player_2 : player_1
end

def calculate_score(player)
  i = 0
  player.deck.reverse.sum do |card|
    i += 1
    card * i
  end
end

player_1 = Player.new(deck_1)
player_2 = Player.new(deck_2)

# until player_1.deck.empty? || player_2.deck.empty?
#   round(player_1, player_2)
# end

game_winner = find_winner(player_1, player_2)
# puts 'Part 1:'
# p calculate_score(game_winner)

## Part 2 ##

@previous_rounds = Hash.new

# if card_value is greater than either deck size play another recursive round
# Otherwise determine winner like usual


def recursive_round(player_1, player_2)
  winner = nil
  return player_1 if @previous_rounds[[player_1.deck, player_2.deck]]
  @previous_rounds[[player_1.deck, player_2.deck]] = true
  card_1, card_2 = player_1.deck.shift, player_2.deck.shift
  if card_1 <= player_1.deck.size && card_2 <= player_2.deck.size
    recursive_player_1 = Player.new(player_1.deck)
    recursive_player_2 = Player.new(player_2.deck)
    winner = recursive_round(recursive_player_1, recursive_player_2)
  end
  if card_1 > card_2 && winner.nil?
    winner = player_1
  elsif winner.nil?
    winner = player_2
  end
  loser = player_1 if winner == player_2
  loser = player_2 if winner == player_1
  winner.deck.push(card_1, card_2)
  winner
end

player_2_1 = Player.new(deck_1)
player_2_2 = Player.new(deck_2)

until player_2_1.deck.empty? || player_2_2.deck.empty?
  recursive_round(player_2_1, player_2_2)
end
require "pry"; binding.pry
game_winner = find_winner(player_2_1, player_2_2)
puts 'Part 2:'
p calculate_score(game_winner)
