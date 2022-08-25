import 'package:flutter/material.dart';
import 'package:states_widgets_routes/models/language.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<Language> languages = [
    Language("Android Nativo", "Linguagem C, Java, Kotlin"),
    Language("IOS Nativo", "Linguagem Objective-C, Swift"),
    Language("Flutter", "Linguagen Javascript, Pascal, Dart"),
  ];

  Widget title = const Text('Minhas Linguagens');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: title,
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
