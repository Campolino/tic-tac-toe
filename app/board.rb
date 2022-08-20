class Board
  attr_reader :cells

  def initialize()
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]  
  end

  def display
    puts <<-HEREDOC

       #{cells[0]} | #{cells[1]} | #{cells[2]}
      ---+---+---
       #{cells[3]} | #{cells[4]} | #{cells[5]}
      ---+---+---
       #{cells[6]} | #{cells[7]} | #{cells[8]}
    
    HEREDOC
  end

  def update_board(number, symbol)
    @cells[number] = symbol
  end
end