require 'socket'
require_relative './board'

class Game
  def start_server()
    server = TCPServer.open(2000)
    board = Board.new
    board.randomize_grid()
    loop {
       client = server.accept
       client.puts('a5')
       client.close
    }
  end
  def start_client()
    board = Board.new
    board.randomize_grid()

    hostname = 'localhost'
    port = 2000

    s = TCPSocket.open(hostname, port)

    while line = s.gets
      puts line.chop
      puts board.check_occupied(line.chop)
    end
    s.close
  end
end
