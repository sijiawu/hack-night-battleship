require 'socket'

class Game
  def start_server
    STDOUT.puts("Please enter the Port")
    port = STDIN.gets.chomp

    Server.new port
  end
  def start_client
    STDOUT.puts("Please enter the server IP")
    server = STDIN.gets.chomp
    STDOUT.puts("Please enter the Port")
    port = STDIN.gets.chomp

    socket = TCPSocket.open(server, port)
    Client.new(socket)
  end
end
