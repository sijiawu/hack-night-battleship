require 'ruby2d'
require_relative './board'

set title: "Battleship"
set background: 'gray'

@text = Text.new(
  'a little line of text trying to be helpful',
  x: 150, y: 370,
  size: 20,
  color: 'black'
)

start1X = 50
startY = 50
start2X = 340
size = 25
board1 = []
board2 = []

column_key = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j']

board1obj = Board.new
board2obj = Board.new

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
    square = Square.new(x: currentX, y: currentY, size: size, color: "teal")
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
    square = Square.new(x: currentX, y: currentY, size: size, color: "teal")
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

@currState = "placeShip"

class Ship
  attr_accessor :coordinates
  def initialize(coordinates)
    @coordinates = coordinates
  end

  def isSunk
    return coordinates.values.uniq == [1]
  end 
end

ship1 = Ship.new({"a1"=>0,"a2"=>0,"a3"=>0})
ship2 = Ship.new({"b4"=>0,"c4"=>0,"d4"=>0,"e4"=>0})
ship3 = Ship.new({"e1"=>0,"e2"=>0,"e3"=>0})
ship4 = Ship.new({"c6"=>0,"d6"=>0,"e6"=>0,"f6"=>0})

player1Ships = [ship1,ship2]
player2Ships = [ship3,ship4]

def checkIfHitsShip(coordinate,ships)
  ships.each do |ship|
    if ship.coordinates.has_key? coordinate
      ship.coordinates[coordinate] = 1
      if ship.isSunk
        if ships.map(&:isSunk).uniq == [true]
          @text.text = "Game Over! You won! "
          #actually end the game
        else
          @text.text = "Woot woot! You sank a ship! "
        end
      else
        @text.text = "Nice! You hit something! "
      end
      return true
    end
  end
  @text.text = "Boo... "

  return false
end

on :mouse_down do |event|
  # x and y coordinates of the mouse button event

  case @currState
  when "placeShip"
    @text.text = "Start game - player1's turn! "
    @currState = "player1Play"

  when "player1Play"
    board2.each do |cell| 
      if event.x < cell.square.x + cell.square.size && event.x > cell.square.x && event.y < cell.square.y + cell.square.size && event.y > cell.square.y 
        coordinate = column_key[cell.col].to_s + (cell.row + 1).to_s
        
        if checkIfHitsShip(coordinate,player2Ships) 
          cell.square.color = 'black'
        else
          cell.square.color = 'blue'
        end

        p coordinate
        board1obj.set_cell(coordinate, 1)
        p board1obj.get_grid()

        @currState = "player2Play"
        @text.text += "player2's turn! "

        break
      end
    end

  when "player2Play"
    board1.each do |cell| 
      if event.x < cell.square.x + cell.square.size && event.x > cell.square.x && event.y < cell.square.y + cell.square.size && event.y > cell.square.y 

        coordinate = column_key[cell.col].to_s + (cell.row + 1).to_s
        if checkIfHitsShip(coordinate,player1Ships) 
          cell.square.color = 'black'
        else
          cell.square.color = 'blue'
        end
        p coordinate
        board2obj.set_cell(coordinate, 1)
        p board2obj.get_grid()

        @currState = "player1Play"
        @text.text += "player1's turn! "

        break
      end
    end
  end
end

show
