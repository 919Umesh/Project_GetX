import 'package:get/get.dart';

class ManagerPagesGetx extends GetxController {
  List<Person> people = [
    const Person('Mike', 'Barron', 64),
    const Person('Todd', 'Black', 30),
    const Person('Ahmad', 'Edwards', 55),
    const Person('Anthony', 'Johnson', 67),
    const Person('Annette', 'Brooks', 39),
  ];
}

class Person implements Comparable<Person> {
  final String name, surname;
  final num age;

  const Person(this.name, this.surname, this.age);

  @override
  int compareTo(Person other) => name.compareTo(other.name);
}
