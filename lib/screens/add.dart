import 'package:flutter/material.dart';
import 'package:states_widgets_routes/models/language.dart';

class AddLanguage extends StatelessWidget {
  AddLanguage({Key? key}) : super(key: key);

  final Text title = const Text("Nova linguagem");
  final EdgeInsets padding = const EdgeInsets.all(16);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: title),
        body: Padding(
            padding: padding,
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Nome da linguagem",
                        labelText: "Nome da linguagem",
                      ),
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Preencha o nome da linguagem";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Descrição da linguagem",
                        labelText: "Descrição da linguagem",
                      ),
                      controller: _descriptionController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Preencha a descrição da linguagem";
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                        child: const Text("Adicionar"),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Language language = Language(
                              _nameController.text,
                              _descriptionController.text,
                            );

                            Navigator.pop(context, language);
                          }
                        },
                      ),
                    ),
                  ],
                ))));
  }
}
