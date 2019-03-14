require 'ruby2d'

set title: "Battleship"
set background: 'gray'

start1X = 50
startY = 50
start2X = 340
size = 25
board1 = []
board2 = []

class Cell
  attr_accessor :col, :row, :square
  def initialize(col, row, square)
    @col = col
    @row = row
    @square = square
  end
end


i = 0
while i < 10
  j = 0
  currentX = start1X + i * size 
  while j < 10
    currentY = startY + j * size 
    square = Square.new(x: currentX, y: currentY, size: size)
    cell = Cell.new(i, j, square)

    l1 = Line.new(x1: currentX, y1: currentY, x2: currentX + size, y2: currentY, width: 1, color: 'black')
    l2 = Line.new(x1: currentX, y1: currentY, x2: currentX, y2: currentY + size, width: 1, color: 'black')
    l3 = Line.new(x1: currentX + size, y1: currentY + size, x2: currentX + size, y2: currentY, width: 1, color: 'black')
    l4 = Line.new(x1: currentX + size, y1: currentY + size, x2: currentX, y2: currentY + size, width: 1, color: 'black')

    j += 1
    board1 << cell 
  end
  i += 1
end

i = 0
while i < 10
  j = 0
  currentX = start2X + i * size 
  while j < 10
    currentY = startY + j * size 
    square = Square.new(x: currentX, y: currentY, size: size)
    cell = Cell.new(i, j, square)

    l1 = Line.new(x1: currentX, y1: currentY, x2: currentX + size, y2: currentY, width: 1, color: 'black')
    l2 = Line.new(x1: currentX, y1: currentY, x2: currentX, y2: currentY + size, width: 1, color: 'black')
    l3 = Line.new(x1: currentX + size, y1: currentY + size, x2: currentX + size, y2: currentY, width: 1, color: 'black')
    l4 = Line.new(x1: currentX + size, y1: currentY + size, x2: currentX, y2: currentY + size, width: 1, color: 'black')

    j += 1
    board2 << cell 
  end
  i += 1
end

on :mouse_down do |event|
  # x and y coordinates of the mouse button event
  puts event.x, event.y


  board1.each do |cell| 
    if event.x < cell.square.x + cell.square.size && event.x > cell.square.x && event.y < cell.square.y + cell.square.size && event.y > cell.square.y 
      cell.square.color = 'teal'
      break
    end
  end

  board2.each do |cell| 
    if event.x < cell.square.x + cell.square.size && event.x > cell.square.x && event.y < cell.square.y + cell.square.size && event.y > cell.square.y 
      cell.square.color = 'blue'
      break
    end
  end
end

show
