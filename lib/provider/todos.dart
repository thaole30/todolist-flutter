import 'package:flutter/widgets.dart';
import 'package:my_todo/model/todos.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
        title: 'Buy Food 😋',
        description: '''- Eggs
- Milk
- Bread
- Water''',
        isCompleted: true),
    Todo(
      title: 'Plan family trip to Norway',
      description: '''- Rent some hotels
- Rent a car
- Pack suitcase''',
      isCompleted: false,
    ),
    Todo(
      title: 'Plan Jacobs birthday party 🎉🥳',
      isCompleted: false,
    ),
  ];

  int get todoCount => _todos.length;

  List<Todo> get todosNotCompleted =>
      _todos.where((todo) => todo.isCompleted == false).toList();

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isCompleted == true).toList();

  void addTodo(Todo todo) {
    print("add todo");
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);

    notifyListeners();
  }

  toggleTodoStatus(Todo todo) {
    todo.isCompleted = !todo.isCompleted;
    notifyListeners();
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}
