import 'package:crocodic_login/constant.dart';
import 'package:crocodic_login/model.dart';
import 'package:crocodic_login/views/details/detailspage.dart';

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
        "age": "28",
        "number": "7349282382",
        "imageUrl":
            "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=766&q=80"
      },
      {
        "firstName": "James",
        "lastName": "Smith",
        "gender": "male",
        "age": "21",
        "number": "5678568567",
        "imageUrl":
            "https://images.unsplash.com/photo-1595956553066-fe24a8c33395?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
      },
      {
        "firstName": "Trevor",
        "lastName": "Philips",
        "gender": "male",
        "age": "22",
        "number": "456754675",
        "imageUrl":
            "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
      },
      {
        "firstName": "Franklin",
        "lastName": "Clinton",
        "gender": "male",
        "age": "23",
        "number": "456754675",
        "imageUrl":
            "https://images.unsplash.com/photo-1544348817-5f2cf14b88c8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
      },
      {
        "firstName": "Michael",
        "lastName": "Gunawan",
        "gender": "male",
        "age": "24",
        "number": "456754675",
        "imageUrl":
            "https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
      },
      {
        "firstName": "Messi",
        "lastName": "Leo",
        "gender": "male",
        "age": "38",
        "number": "456754675",
        "imageUrl":
            "https://images.unsplash.com/photo-1587397845856-e6cf49176c70?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
      },
      {
        "firstName": "Ronaldo",
        "lastName": "Bara",
        "gender": "male",
        "age": "48",
        "number": "456754675",
        "imageUrl":
            "https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=712&q=80"
      },
      {
        "firstName": "Obama",
        "lastName": "Pratama",
        "gender": "male",
        "age": "58",
        "number": "456754675",
        "imageUrl":
            "https://images.unsplash.com/photo-1580130379624-3a069adbffc5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8b2JhbWF8ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60"
      }
    ];

    return data.map<PersonElement>(PersonElement.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        person: person[index],
                      ),
                    ),
                  );
                },
                trailing: TextButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.arrow_circle_right,
                    color: Colors.black,
                  ),
                ),
                title: Row(
                  children: [
                    Text(
                      orang.firstName,
                    ),
                    Text(
                      ' ${orang.lastName}',
                    ),
                  ],
                ),
                subtitle: Text(
                  '+62 ${orang.number}',
                ),
                leading: Image.network(
                  orang.imageUrl,
                  scale: 1,
                  fit: BoxFit.contain,
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/ScrollPage',
          );
        },
        child: const Center(
          child: Icon(Icons.arrow_right_sharp),
        ),
      ),
    );
  }
}
