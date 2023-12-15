import 'dart:isolate';
//Многопоточность
void main() async {
  final receivePort1 = ReceivePort();
  final receivePort2 = ReceivePort();

  await Isolate.spawn(isolateFunction, receivePort1.sendPort);
  await Isolate.spawn(isolateFunction, receivePort2.sendPort);

  final message1 = await receivePort1.first;
  final message2 = await receivePort2.first;

  print('Изолят 1: $message1');
  print('Изолят 2: $message2');
}

void isolateFunction(SendPort sendPort) {
  sendPort.send('Hello world!');
}
