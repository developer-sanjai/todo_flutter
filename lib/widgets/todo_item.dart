import 'package:flutter/material.dart';
import 'package:todo_flutter/constants/colors.dart';
import 'package:todo_flutter/model/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final onToDoChanged;
  final onDeleted;

  //Constructor
  const TodoItem(
      {super.key,
      required this.todo,
      required this.onToDoChanged,
      required this.onDeleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            // calling _handleTodoChanged
            onToDoChanged(todo);
            print('checked');
          },
          icon: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: tdBlue,
          ),
        ),
        title: Text(
          todo.text,
          style: TextStyle(
              fontSize: 16,
              color: tdBlack,
              decoration: todo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: IconButton(
          onPressed: () {
            // calling handleTodoDeleted
            onDeleted(todo.id);
            print('deleted');
          },
          icon: const Icon(
            Icons.delete,
            color: tdRed,
          ),
        ),
      ),
    );
  }
}
