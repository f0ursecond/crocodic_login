import 'package:crocodic_login/controller/darkmode_controller.dart';
import 'package:crocodic_login/model.dart';
import 'package:crocodic_login/views/details/detailspage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        "gender": "Male",
        "age": "28",
        "number": "7349282382",
        "imageUrl":
            "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=766&q=80"
      },
      {
        "firstName": "James",
        "lastName": "Smith",
        "gender": "Male",
        "age": "21",
        "number": "5678568567",
        "imageUrl":
            "https://images.unsplash.com/photo-1595956553066-fe24a8c33395?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
      },
      {
        "firstName": "Trevor",
        "lastName": "Philips",
        "gender": "Male",
        "age": "22",
        "number": "456754675",
        "imageUrl":
            "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
      },
      {
        "firstName": "Franklin",
        "lastName": "Clinton",
        "gender": "Male",
        "age": "23",
        "number": "456754675",
        "imageUrl":
            "https://images.unsplash.com/photo-1544348817-5f2cf14b88c8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
      },
      {
        "firstName": "Michael",
        "lastName": "Gunawan",
        "gender": "Male",
        "age": "24",
        "number": "456754675",
        "imageUrl":
            "https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
      },
      {
        "firstName": "Messi",
        "lastName": "Leo",
        "gender": "Male",
        "age": "38",
        "number": "456754675",
        "imageUrl":
            "https://images.unsplash.com/photo-1587397845856-e6cf49176c70?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
      },
      {
        "firstName": "Ronaldo",
        "lastName": "Bara",
        "gender": "Male",
        "age": "48",
        "number": "456754675",
        "imageUrl":
            "https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=712&q=80"
      },
      {
        "firstName": "Obama",
        "lastName": "Pratama",
        "gender": "Male",
        "age": "58",
        "number": "456754675",
        "imageUrl":
            "https://images.unsplash.com/photo-1580130379624-3a069adbffc5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8b2JhbWF8ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60"
      },
      {
        "firstName": "Taylor",
        "lastName": "Swift",
        "gender": "Female",
        "age": "58",
        "number": "456754675",
        "imageUrl":
            "https://images.unsplash.com/photo-1581044777550-4cfa60707c03?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80"
      },
    ];

    return data.map<PersonElement>(PersonElement.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    final c = Get.find<ChangeTheme>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => c.isDarkTheme(),
            icon: c.isDark.value
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
          )
        ],
        title: const Text(
          'ListView',
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: person.length,
          itemBuilder: (context, index) {
            final orang = person[index];
            return Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).focusColor,
                ),
              ),
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
                  child: Icon(
                    Icons.edit,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                title: Row(
                  children: [
                    Text(
                      orang.firstName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      ' ${orang.lastName}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                subtitle: Text(
                  '+62 ${orang.number}',
                  style: Theme.of(context).textTheme.titleMedium,
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
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/ScrollPage',
          );
        },
        child: Center(
          child: Icon(
            Icons.arrow_right_sharp,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
    );
  }
}
