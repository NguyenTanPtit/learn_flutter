import 'dart:collection';

import 'package:learn_flutter/people.dart';

late int a;
enum Color { red, green, blue }
void main(){
  // List<int> list = [1, 2, 3];
  // print(list.firstWhere((element) => element == 2, orElse: () => 0));
  // print(Color.values.firstOrNull??'not found');
  // list.forEach((element) {
  //   print(element);
  // });

  // var q1 = Queue();
  // q1.add(1);
  // q1.add(2);
  // q1.add(3);
  // print(q1);
  // print(q1.every((element) => element >= 1));
  // logSt();
  // print(add(a: 4, b: 10));

  People p1 = People(name: 'John Doe', email: 'test@gmail.com', phone: '1234567890', address: '123 Main St', age: '25');
  var listPeople= People.getPeople();
  print(p1);
  listPeople.forEach((element) => print(element));

}

void logSt(){
  print('log');
}

int add({int? a, int? b}){
  return (a??0) + (b??0);
}