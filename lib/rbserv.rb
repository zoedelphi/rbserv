# Simple webserver written in Ruby.
# Written by Zoe Picone with lots of code 
# taken from Ruslan Spivak's tutorial.

require 'socket'

HOST, PORT = '', 8888;

listener = Socket.new Socket::AF_INET, Socket::SOCK_STREAM
listener.setsockopt Socket::SOL_SOCKET, Socket::SO_REUSEADDR, 1
listener.bind Addrinfo.tcp HOST, PORT
listener.listen 1

puts "Serving HTTP on port #{PORT} ..."
loop do
  connection, address = listener.accept
  request_data = connection.recvfrom 1024
  
  http_response = "\
  HTTP/1.1 200 OK
  
  Hello, World!
  ".force_encoding "ASCII-8BIT"
  
  connection.send http_response, 0
  connection.close
end
