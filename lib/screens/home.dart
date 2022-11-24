import 'package:flutter/material.dart';
import 'package:todo_flutter/constants/colors.dart';
import 'package:todo_flutter/widgets/SearchBar.dart';
import 'package:todo_flutter/widgets/todolist.dart';

class Home extends StatelessWidget {
  final String title;

  // Constructor
  const Home({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: tdBGColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: const [
            SearchBar(),
            Todolist(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.menu,
                color: tdBlack,
                size: 30,
              )),
          Text(
            title,
            style: const TextStyle(fontFamily: 'Rubik', color: tdRed),
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/dp.png')),
          )
        ],
      ),
      backgroundColor: tdBlue,
    );
  }
}
