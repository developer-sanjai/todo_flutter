import 'package:flutter/material.dart';
import 'package:todo_flutter/constants/colors.dart';

class BottomStack extends StatelessWidget {
  final todoController;
  final addtodoItem;

  //Constructor
  const BottomStack(
      {super.key, required this.todoController, required this.addtodoItem});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: TextField(
                controller: todoController,
                decoration: const InputDecoration(
                  hintText: 'Add a new todo item',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 20,
              right: 20,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: tdBlue,
                minimumSize: const Size(55, 55),
                elevation: 10,
              ),
              child: const Text(
                "+",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              onPressed: () {
                addtodoItem(todoController.text);
              },
            ),
          )
        ],
      ),
    );
  }
}
