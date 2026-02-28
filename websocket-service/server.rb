
require 'socket'

server = TCPServer.new 6000
puts "WebSocket-ready TCP server running on port 6000"

loop do
  client = server.accept
  client.puts "Motivabot WebSocket Layer Ready"
  client.close
end
