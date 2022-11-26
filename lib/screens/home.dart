import 'package:flutter/material.dart';
import 'package:todo_flutter/constants/colors.dart';
import 'package:todo_flutter/widgets/SearchBar.dart';
import 'package:todo_flutter/widgets/todolist.dart';

class Home extends StatelessWidget {
  final String title;
  //Constructor
  const Home({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: tdBGColor,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: const [
                SearchBar(),
                Todolist(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin:
                        const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
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
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ],
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
                color: Colors.white,
                size: 30,
              )),
          Text(
            title,
            style: const TextStyle(fontFamily: 'Rubik', color: Colors.white),
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
