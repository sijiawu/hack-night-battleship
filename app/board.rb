class Board
  attr_accessor :grid

  def initialize()
    self.grid = {
      "a" => [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      "b" => [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      "c" => [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      "d" => [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      "e" => [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      "f" => [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      "g" => [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      "h" => [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      "i" => [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      "j" => [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    }
  end

  def get_grid()
    self.grid
  end

  def randomize_grid()
    self.grid.each do |rowname, row|
      row.each_index do |pos|
        self.grid[rowname][pos] = rand 10
      end
    end
  end

  def add_ship(length, direction, start)
    ship = Ship.new
    for pos in 0..length do
      self.set_cell(start, ship)
    end
  end

  def check_occupied(position)
    self.get_cell(position) > 0
  end

  def get_cell(position)
    self.grid[position[0]][position[1].to_i - 1]
  end

  def set_cell(position, value)
    self.grid[position[0]][position[1].to_i - 1] = value
  end
end
