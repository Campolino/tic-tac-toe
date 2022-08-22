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
end