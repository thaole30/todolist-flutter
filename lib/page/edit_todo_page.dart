import 'package:flutter/material.dart';
import 'package:my_todo/model/todos.dart';
import 'package:my_todo/provider/todos.dart';
import 'package:my_todo/widget/todo_form_widget.dart';
import 'package:provider/provider.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();

  late String title;
  late String description;

  @override
  void initState() {
    super.initState();

    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Edit Todo'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: TodoFormWidget(
              title: title,
              description: description,
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.send_outlined, color: Colors.white),
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onPressed: saveTodo,
        ),
      );

  void saveTodo() {
    // final isValid = _formKey.currentState.validate();

    // if (!isValid) {
    //   return;
    // } else {
    //   final provider = Provider.of<TodosProvider>(context, listen: false);

    //   provider.updateTodo(widget.todo, title, description);

    //   Navigator.of(context).pop();
    // }

    final provider = Provider.of<TodosProvider>(context, listen: false);

    provider.updateTodo(widget.todo, title, description);

    Navigator.of(context).pop();
  }
}
