/* Developed by Eng Mouaz M. AlShahmeh */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/controllers/todo_provider.dart';
import 'package:provider_example/models/todo.dart';
import 'package:provider_example/views/screens/crud/list.dart';
import 'package:provider_example/views/widgets/button.dart';
import 'package:provider_example/views/widgets/text_form_field.dart';

class CreateTodo extends StatelessWidget {
  CreateTodo({Key? key}) : super(key: key);

  final _createKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: if you do not need listen always you can use read
    TodoProvider todoProvider = context.read<TodoProvider>();

    final TextEditingController titleController =
    TextEditingController(text: todoProvider.title ?? '');
    titleController.value = titleController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(
          offset: todoProvider.title != null ? todoProvider.title!.length : 0,
        ),
      ),
    );

    final TextEditingController dscController =
    TextEditingController(text: todoProvider.dsc ?? '');
    dscController.value = dscController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(
          offset: todoProvider.dsc != null ? todoProvider.dsc!.length : 0,
        ),
      ),
    );

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Create Todo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Form(
            key: _createKey,
            child: Column(
              children: [
                iTextFormField(
                  context,
                  'Todo Text',
                  'Enter Todo Text',
                  Icons.title,
                  (val) => todoProvider.setTitle(val),
                    titleController
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                iTextFormField(
                  context,
                  'Todo Dsc',
                  'Enter Todo Dsc',
                  Icons.description,
                  (val) => todoProvider.setDsc(val),
                    dscController
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                iOutlinedButton(context, _createKey, 'Add Todo', () {
                  todoProvider.addToList(TodoModel(
                      id: DateTime.now().microsecond,
                      title: todoProvider.title,
                      dsc: todoProvider.dsc));
                  todoProvider.setTitle('');
                  todoProvider.setDsc('');
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const TodoList()));
                }),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
