import 'dart:io';

void main() {
  // Запись в файл
  writeFile('example.txt', 'Привет, мир!');

  // Чтение из файла
  readFile('example.txt');
}

void writeFile(String path, String content) {
  File file = File(path);

  // Запись в файл
  file.writeAsStringSync(content);

  print('Файл записан успешно.');
}

void readFile(String path) {
  File file = File(path);

  // Проверка существования файла
  if (!file.existsSync()) {
    print('Файл не существует.');
    return;
  }

  // Чтение из файла
  String content = file.readAsStringSync();

  print('Содержимое файла: $content');
}
