require_relative '../app/board'

describe Board do
  subject(:board) { described_class.new }

  describe "#update_board" do
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
  end

end