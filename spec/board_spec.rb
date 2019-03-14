require_relative '../app/board'

describe 'Board' do
  it 'can initialize' do
    board = Board.new
    expect(board).not_to be nil
  end
end