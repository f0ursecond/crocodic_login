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
  String age;
  String number;
  String imageUrl;

  PersonElement({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.age,
    required this.number,
    required this.imageUrl,
  });

  factory PersonElement.fromJson(Map<String, dynamic> person) => PersonElement(
        firstName: person["firstName"],
        lastName: person["lastName"],
        gender: person["gender"],
        age: person["age"],
        number: person["number"],
        imageUrl: person["imageUrl"],
      );
}
