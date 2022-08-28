import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_todo/provider/todos.dart';
import 'package:my_todo/widget/add_todo_dialog_widget.dart';
import 'package:my_todo/widget/completed_list_widget.dart';
import 'package:my_todo/widget/todo_list_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final options = [
    TodoListWidget(),
    CompletedListWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todoCount = provider.todoCount;

    return Scaffold(
      appBar: AppBar(
        title: Text("My Todolist ($todoCount)"),
      ),
      body: options[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.ads_click),
            label: 'not done',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_rounded),
            label: 'done',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple[700],
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddTodoDialogWidget(),
          barrierDismissible: true,
        ),
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
      ),
    );
  }
}
