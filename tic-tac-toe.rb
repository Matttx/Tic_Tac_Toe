def check_board(game_board)
  game_board.each do |line|
    for i in 0...line.length
      if line[i] == ' '
        return (0)
      end
    end
  end
  return (1)
end

def check_win(game_board, turn)
  if turn % 2 == 0
    char = 'X'
  else
    char = 'O'
  end
  if game_board[1][1] == char && game_board[2][3] == char && game_board[3][5] == char
    return 1
  end
  if game_board[1][5] == char && game_board[2][3] == char && game_board[3][1] == char
    return 1
  end
  for i in 1...5
    if game_board[i][1] == char && game_board[i][3] == char && game_board[i][5] == char
      return 1
    end
  end
  for i in 1...7
    if game_board[1][i] == char && game_board[2][i] == char && game_board[3][i] == char
      return 1
    end
  end
end

def put_char(game_board, coord, turn)
  x = coord[1] * 2 - 1
  y = coord[0]
  if turn % 2 == 0
    if game_board[y][x] == ' '
      game_board[y][x] = 'X'
    else
      puts "Vous ne pouvez pas jouer ici !"
      return -1
    end
  else
    if game_board[y][x] == ' '
      game_board[y][x] = 'O'
    else
      puts "Vous ne pouvez pas jouer ici !"
      return -1
    end
  end
end

def information(turn)
  if turn % 2 == 0
    puts "\nC'est au joueur n°1 de jouer:\n"
  else
    puts "\nC'est au joueur n°2 de jouer:\n"
  end
end

def game_loop(game_board)
  turn = 0
  while check_board(game_board) != 1
    information(turn)
    coord = gets.chomp
    coord = coord.split(' ')
    coord = coord.map(&:to_i)
    if coord.length != 2
      puts "\nRentrez des coordonnées correctes\n"
      turn -= 1
    else
      if put_char(game_board, coord, turn) == -1
        turn -= 1
      end
    end
    puts game_board
    if check_win(game_board, turn) == 1
      if turn % 2 == 0
        puts "\nLe joueur n°1 à gagné la partie !!!"
      else
        puts "\nLe joueur n°2 à gagné la partie !!!"
      end
      return 0
    end
      turn += 1
  end
end

def main
  game_board = ["#######", "# | | #", "# | | #", "# | | #", "#######"]
  puts game_board
  game_loop(game_board)
end

main