import 'package:crocodic_login/constant.dart';
import 'package:crocodic_login/model.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/HomePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PersonElement> person = getPerson();

  static List<PersonElement> getPerson() {
    const data = [
      {
        "firstName": "Joe",
        "lastName": "Jackson",
        "gender": "male",
        "age": 28,
        "number": "7349282382"
      },
      {
        "firstName": "James",
        "lastName": "Smith",
        "gender": "male",
        "age": 32,
        "number": "5678568567"
      },
      {
        "firstName": "Trevor",
        "lastName": "Philips",
        "gender": "male",
        "age": 24,
        "number": "456754675"
      },
      {
        "firstName": "Franklin",
        "lastName": "Clinton",
        "gender": "male",
        "age": 22,
        "number": "456754675"
      },
      {
        "firstName": "Michael",
        "lastName": "Gunawan",
        "gender": "male",
        "age": 24,
        "number": "456754675"
      },
      {
        "firstName": "Messi",
        "lastName": "Leo",
        "gender": "male",
        "age": 28,
        "number": "456754675"
      },
      {
        "firstName": "Ronaldo",
        "lastName": "Bara",
        "gender": "male",
        "age": 24,
        "number": "456754675"
      },
      {
        "firstName": "Obama",
        "lastName": "Pratama",
        "gender": "male",
        "age": 30,
        "number": "456754675"
      }
    ];

    return data.map<PersonElement>(PersonElement.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    var faker = Faker();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
        elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: person.length,
          itemBuilder: (context, index) {
            final orang = person[index];
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/DetailsPage',
                  );
                },
                trailing: TextButton(
                  onPressed: () {},
                  child: const Text('->'),
                ),
                title: Text(
                  orang.firstName,
                ),
                subtitle: Text(
                  faker.internet.email(),
                ),
                leading: Image.network(
                  faker.image.image(
                    height: 100,
                    width: 100,
                    random: true,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
