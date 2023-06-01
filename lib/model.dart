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

class Biodata {
  String imageUrl;
  String nama;
  String kota;
  String tgllahir;
  String description;

  Biodata({
    required this.imageUrl,
    required this.nama,
    required this.kota,
    required this.tgllahir,
    required this.description,
  });

  setData({
    required String imageUrl,
    required String nama,
    required String kota,
    required String tgllahir,
    required String description,
  }) {
    this.imageUrl = imageUrl;
    this.nama = nama;
    this.kota = kota;
    this.tgllahir = tgllahir;
    this.description = description;
  }
}
