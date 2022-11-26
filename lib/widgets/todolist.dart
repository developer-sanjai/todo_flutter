import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_flutter/model/todo.dart';
import 'package:todo_flutter/widgets/todo_item.dart';

class Todolist extends StatefulWidget {
  const Todolist({super.key});
  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  final _todos = Todo.todoList();
  void _handleToDoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _handleToDoDeleted(int id) {
    print("triggering..");
    setState(() {
      _todos.removeWhere((todo) => todo.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Stack(children: [
            Container(
              margin: const EdgeInsets.only(top: 50, bottom: 20),
              child: const Text(
                'All ToDos',
                style: TextStyle(fontSize: 30, fontFamily: 'Rubik'),
              ),
            ),
          ]),
          for (var todo in _todos)
            TodoItem(
              todo: todo,
              onDeleted: _handleToDoDeleted,
              onToDoChanged: _handleToDoChange,
            ),
        ],
      ),
    );
  }
}
