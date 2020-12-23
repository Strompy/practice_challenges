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

until player_1.deck.empty? || player_2.deck.empty?
  round(player_1, player_2)
end

game_winner = find_winner(player_1, player_2)
puts 'Part 1:'
p calculate_score(game_winner)
