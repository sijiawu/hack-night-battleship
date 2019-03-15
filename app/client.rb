require "socket"

class Client
  def initialize(socket)
    @socket = socket
    @request_object = send_request
    @response_object = listen_response

    @request_object.join # will send the request to server
    @response_object.join # will receive response from server

    @board = Board.new
  end

  def send_request
    # puts "Please enter your username to establish a connection..."
    begin
      Thread.new do
        loop do
          print 'Client, enter a coordinate: '
          $stdout.flush
          message = $stdin.gets.chomp
          @socket.puts message
        end
      end
    rescue IOError => e
      puts e.message
      # e.backtrace
      @socket.close
    end
  end

  def listen_response
    begin
      Thread.new do
        loop do
          response = @socket.gets.chomp
          puts "#{response}"
          if /^([a-z][1-9]0?)/.match(response)
            # result = @board.check_occupied(response)
            result = 'false'
            @socket.puts "client says #{response} is #{result}"
          end
          if response.eql?'quit'
            @socket.close
          end
        end
      end
    rescue IOError => e
      puts e.message
      # e.backtrace
      @socket.close
    end
  end
end
