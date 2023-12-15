import 'dart:io';

void main() async {
  try {
    var socket = await Socket.connect('127.0.0.1', 4040);
    print('Connected to server');

    sendMessage(socket, 'Hello');

    await Future.delayed(Duration(seconds: 1));
    sendMessage(socket, 'Salam');

    socket.close();
  } catch (e) {
    print('Error: $e');
  }
}

void sendMessage(Socket socket, String message) {
  print('Sending message to server: $message');
  socket.write(message);
}
