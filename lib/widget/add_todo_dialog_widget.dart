import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_todo/model/todos.dart';
import 'package:my_todo/provider/todos.dart';
import 'package:my_todo/widget/todo_form_widget.dart';
import 'package:provider/provider.dart';

class AddTodoDialogWidget extends StatefulWidget {
  const AddTodoDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddTodoDialogWidget> createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Add your todo',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25, color: Colors.purple),
      ),
      content: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: TodoFormWidget(
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) =>
                setState(() => this.description = description),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Add'),
          onPressed: addTodo,
        ),
      ],
    );
  }

  void addTodo() {
    final isValid = _formKey.currentState?.validate();
    print("check validate $isValid");

    // if (!isValid) {
    //   return;
    // } else {
    //   final todo = Todo(
    //     id: DateTime.now().toString(),
    //     title: title,
    //     description: description,
    //     createdTime: DateTime.now(),
    //   );

    //   final provider = Provider.of<TodosProvider>(context, listen: false);
    //   provider.addTodo(todo);

    //   Navigator.of(context).pop();
    // }

    final todo = Todo(
      id: DateTime.now().toString(),
      title: title,
      description: description,
    );

    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.addTodo(todo);

    Navigator.of(context).pop();
  }
}
