import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_todo/model/todos.dart';
import 'package:my_todo/page/edit_todo_page.dart';
import 'package:my_todo/provider/todos.dart';
import 'package:provider/provider.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({required this.todo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Checkbox(
            value: todo.isCompleted,
            onChanged: (_) {
              final provider =
                  Provider.of<TodosProvider>(context, listen: false);
              provider.toggleTodoStatus(todo);
            },
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  todo.title,
                  style: TextStyle(
                    decoration: todo.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                if (todo.description.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      todo.description,
                      style: TextStyle(
                          fontSize: 14, height: 1.5, color: Colors.purple[400]),
                    ),
                  )
              ],
            ),
          ),
          ElevatedButton.icon(
              onPressed: () {
                //OnPressed Logic
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditTodoPage(todo: todo),
                  ),
                );
              },
              icon: const Icon(Icons.edit_outlined),
              label: const Text("")),
          SizedBox(width: 10),
          ElevatedButton.icon(
              onPressed: () {
                //OnPressed Logic
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                provider.removeTodo(todo);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // background
                onPrimary: Colors.white, // foreground
              ),
              icon: const Icon(Icons.delete_outlined),
              label: const Text("")),
        ],
      ),
    );
  }
}
