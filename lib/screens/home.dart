import 'package:flutter/material.dart';
import 'package:states_widgets_routes/models/language.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<Language> languages = [
    Language("Dart", "Dart is a modern programming language developed by Google."),
    Language("Kotlin", "Kotlin is a programming language developed by JetBrains."),
    Language("Java", "Java is a programming language developed by Oracle."),
  ];

  Widget title = const Text('Minhas Linguagens');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: title,
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _goToAddLanguage,
            ),
          ],
        ),
        body: Column(
          children: [
            Wrap(
              spacing: 10,
              children: buildChoices(),
            ),
            Expanded(
                child: ListView(
              children: buildItemsList(),
            ))
          ],
        ));
  }

  void _goToAddLanguage() {
    Future future = Navigator.pushNamed(context, '/add');
    future.then((value) {
      setState(() {
        languages.add(value);
      });
    });
  }

  List<ChoiceChip> buildChoices() {
    return languages
        .map((language) => ChoiceChip(
              label: Text(language.title),
              selected: language.select,
              onSelected: (value) {
                setState(() {
                  language.select = value;
                });
              },
            ))
        .toList();
  }

  List<Widget> buildItemsList() {
    return languages
        .where((language) => language.select)
        .map((language) => Card(
              child: ListTile(
                leading: Icon(language.icon),
                title: Text(language.title),
                subtitle: Text(language.subtitle),
              ),
            ))
        .toList();
  }
}
