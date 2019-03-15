Dir[File.join(__dir__, 'app', '*.rb')].each { |file| require file }

p ARGV

game = Game.new

if ARGV[0] == 'server'
  game.start_server
else
  game.start_client
end