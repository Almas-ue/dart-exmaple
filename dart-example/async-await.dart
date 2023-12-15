import 'dart:async';

void main() async {
  print('Начало программы');

  String result = await fetchData();
  print('Результат: $result');

  print('Конец программы');
}

Future<String> fetchData() async {
  print('Начало загрузки данных');
  
  await Future.delayed(Duration(seconds: 2));

  print('Окончание загрузки данных');

  return 'Данные загружены успешно!';
}
