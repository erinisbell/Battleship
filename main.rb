class Game 

  PIECES = [2, 3, 3, 4, 5]
  def initialize player1, player2
    @players = [player1, player2]
  end



  def welcome 
   puts "Welcome, Frank and HAL 9000!\nIt's time to play Battleship.\n"
  end 


  def place_ships
    puts "Frank, where would you like to place a ship of length 2?\nAcross or Down?\n"+
                  "Frank, where would you like to place a ship of length 3?\nAcross or Down?\n"+
                  "Frank, where would you like to place a ship of length 3?\nAcross or Down?\n"+
                  "Frank, where would you like to place a ship of length 4?\nAcross or Down?\n"+
                  "Frank, where would you like to place a ship of length 5?\nAcross or Down?\n"+
                  "HAL 9000 has placed its ships.\n"
  end 

  def game_cam_be_won x, y
  end 




end 


