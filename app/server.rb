require "socket"

class Server
  def initialize(socket_port)
    @server_socket = TCPServer.new(socket_port)

    @connections_details = Hash.new
    @connected_clients = Hash.new

    @connections_details[:server] = @server_socket
    @connections_details[:clients] = @connected_clients

    puts 'Started server.........'

    @board = Board.new
    run
  end

  def run
    loop {
      client_connection = @server_socket.accept
      Thread.start(client_connection) do |conn| # open thread for each accepted connection
        conn_name = 'client'
        puts "Connection established #{conn_name} => #{conn}"
        @connections_details[:clients][conn_name] = conn
        # conn.puts "Connection established successfully #{conn_name} => #{conn}."

        play(conn_name, conn) # allow chatting
      end
    }.join
  end

  def play(username, connection)
    loop do
      print 'Server, enter your coordinate: '
      $stdout.flush
      ourmessage = $stdin.gets.chomp
      connection.puts "#{ourmessage}"
      message = connection.gets.chomp
      (@connections_details[:clients]).keys.each do |client|
        puts "#{username} : #{message}"
        # result = @board.check_occupied(message)
        if /^([a-z][1-9]0?)/.match(message)
          result = 'false'
          @connections_details[:clients][client].puts "server says #{message} is #{result}"
        end
      end
    end
  end
end
