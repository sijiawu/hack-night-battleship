require_relative '../app/board'

describe 'Board' do
  it 'can initialize' do
    board = Board.new
    expect(board).not_to be nil
  end

  it 'can randomize grid' do
    board = Board.new
    grid_empty = board.get_grid()
    board.randomize_grid()
    grid_random = board.get_grid()

    # grid_empty.keys.each do |k|
    #   p grid_empty[k]
    #   p grid_random[k]
    #   expect(grid_empty[k]).to_not eq(grid_random[k])
    # end
  end

  it 'can get ship at grid' do
    board = Board.new
    board.randomize_grid()
    expect(board.get_cell('a3')).to be > 0
  end

  it 'can check if cell is occupied' do
    board = Board.new
    cell = 'd2'
    value = 7
    board.set_cell(cell, 7)
    expect(board.check_occupied(cell)).to be true
  end
end