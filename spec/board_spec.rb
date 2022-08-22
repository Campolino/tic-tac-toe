require_relative '../app/board'

describe Board do
  subject(:board) { described_class.new }

  describe '#update_board' do
    context 'board is empty' do
      it 'updates cell[index]' do
        player_input = 0
        player_symbol = 'x'
        board.update_board(player_input, player_symbol)
        updated_board = board.cells
        updated_index_zero = ['x', 2, 3, 4, 5, 6, 7, 8, 9]
        
        expect(updated_board).to eq(updated_index_zero)
      end
    end

    context 'board has defined places' do
      before do
        board.instance_variable_set(:@cells, ['x', 2, 3, 'o', 5, 6, 'x', 8, 9])
      end

      it 'updates cell[index]' do
        player_input = 2
        player_symbol = 'o'
        board.update_board(player_input, player_symbol)
        updated_board = board.cells
        updated_index_zero = ['x', 2, 'o', 'o', 5, 6, 'x', 8, 9]
        
        expect(updated_board).to eq(updated_index_zero)
      end
    end    
  end

  describe '#valid_move?' do
    context 'board is empty' do
      it 'is a valid move' do
        player_move = board.is_valid?(3)
        
        expect(player_move).to be true
      end
    end

    context 'board has defined places' do
      before do
        board.instance_variable_set(:@cells, ['x', 2, 3, 'o', 5, 6, 'x', 8, 9])
      end

      it 'player choose an empty place' do
        player_move = board.is_valid?(3)
        
        expect(player_move).to be true
      end

      it 'player choose an occupied place' do
        player_move = board.is_valid?(1)
        
        expect(player_move).to be false
      end
    end
  end

  describe '#full?'do
    context 'board is empty' do
      it 'is full' do        
        expect(board).not_to be_full
      end      
    end
    
    context 'some places are occupied' do
      before do
        board.instance_variable_set(:@cells, %w[x x 3 o 5 o x o o])
      end

      it 'is full' do        
        expect(board).not_to be_full
      end      
    end

    context 'all places are occupied' do
      before do
        board.instance_variable_set(:@cells, %w[x x o o x o x o o])
      end

      it 'is full' do        
        expect(board).to be_full
      end      
    end
  end

  describe '#game_over?' do
    context 'when the board is empty' do
      it 'game is not over' do
        expect(board).not_to be_game_over
      end
    end

    context 'some places are occupied' do
      before do
        board.instance_variable_set(:@cells, %w[x x 3 o 5 o x o o])
      end
      
      it 'game is not over' do
        expect(board).not_to be_game_over
      end
    end
    
    context 'winning combo vertical' do
      before do
        board.instance_variable_set(:@cells, %w[1 2 x o o x 7 8 x])
      end
      
      it 'game is over' do
        expect(board).to be_game_over
      end
    end
     
    context 'winning combo is horizontal' do
      before do
        board.instance_variable_set(:@cells, %w[x x x o o 6 7 8 9])
      end
      
      it 'game is over' do
        expect(board).to be_game_over
      end
    end
     
    context 'winning combo is diagonal' do
      before do
        board.instance_variable_set(:@cells, %w[1 p x o x 6 x 8 9])
      end
      
      it 'game is over' do
        expect(board).to be_game_over
      end
    end
  end
end