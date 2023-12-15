import 'dart:io';

void main() async {
  try {
    var serverSocket = await ServerSocket.bind('127.0.0.1', 4040);
    print('Server listening on port 4040');

    await for (var socket in serverSocket) {
      handleClient(socket);
    }
  } catch (e) {
    print('Error: $e');
  }
}

void handleClient(Socket socket) {
  print('Client connected: ${socket.remoteAddress.address}:${socket.remotePort}');

  socket.listen(
    (List<int> data) {
      String message = String.fromCharCodes(data).trim();
      print('Received message from client: $message');
    },
    onDone: () {
      print('Client disconnected: ${socket.remoteAddress.address}:${socket.remotePort}');
    },
    onError: (error) {
      print('Error: $error');
    },
    cancelOnError: true,
  );
}
