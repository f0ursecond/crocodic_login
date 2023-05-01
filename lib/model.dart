class Person {
  List<PersonElement> person;

  Person({
    required this.person,
  });
}

class PersonElement {
  String firstName;
  String lastName;
  String gender;
  int age;
  String number;

  PersonElement({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.age,
    required this.number,
  });

  factory PersonElement.fromJson(Map<String, dynamic> person) => PersonElement(
        firstName: person["firstName"],
        lastName: person["lastName"],
        gender: person["gender"],
        age: person["age"],
        number: person["number"],
      );
}
