import 'package:flutter/material.dart';
import 'package:my_todo/page/home_page.dart';
import 'package:my_todo/provider/todos.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Todo App';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          // brightness: Brightness.dark,r
          primarySwatch: Colors.purple,
          primaryColor: Colors.purple,
          scaffoldBackgroundColor: Color(0xFFf6f5ee),
        ),
        home: HomePage(),
      ));
}
