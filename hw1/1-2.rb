class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def winner_move(moves)
  return moves.first if moves.uniq.size == 1
  return "P" if moves == %w{ P R }
  return "R" if moves == %w{ R S }
  return "S" if moves == %w{ P S }
end

def rps_game_winner(game)
  players = game.map{|gm| gm[0] }.uniq
  raise WrongNumberOfPlayersError unless game.length == 2 && players.size == 2

  moves = game.map{|gm| gm[1].upcase }.sort
  raise NoSuchStrategyError if (moves.uniq - %w{ P R S }).any?

  wm = winner_move(moves)
  game.find{ |m| m[1] == wm }
end

def rps_tournament_winner(tournament)
  if tournament.first.first.is_a? String
    rps_game_winner(tournament)
  else
    t1, t2 = tournament
    rps_tournament_winner(
      [
        rps_tournament_winner(t1),
        rps_tournament_winner(t2)
      ]
    )
  end
end
