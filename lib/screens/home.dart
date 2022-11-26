import 'package:flutter/material.dart';
import 'package:todo_flutter/constants/colors.dart';
import 'package:todo_flutter/model/todo.dart';
import 'package:todo_flutter/widgets/SearchBar.dart';
import 'package:todo_flutter/widgets/bottomStack.dart';
import 'package:todo_flutter/widgets/todolist.dart';

class Home extends StatefulWidget {
  final String title;
  //Constructor
  const Home({super.key, required this.title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _todos = Todo.todoList(); // Global state
  List<Todo> _foundedTodo = [];
  final _todoController = TextEditingController(); // Textfield handler
  final _SearchController = TextEditingController();

  @override
  void initState() {
    _foundedTodo = _todos;
    super.initState();
  }

  void _handleToDoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _handleToDoDeleted(int id) {
    setState(() {
      _todos.removeWhere((todo) => todo.id == id);
    });
  }

  void _addtodoItem(String todoText) {
    if (todoText.length >= 10) {
      setState(() {
        _todos.add(
            Todo(text: todoText, id: DateTime.now().millisecondsSinceEpoch));
      });
    }
    _todoController.clear();
  }

  void _searchTodo(String searchtext) {
    if (searchtext.isNotEmpty) {
      setState(() {
        _foundedTodo = _foundedTodo
            .where((todo) =>
                todo.text.toLowerCase().contains(searchtext.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        _foundedTodo = _todos;
      });
    }
  }

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
              children: [
                SearchBar(
                    searchController: _SearchController,
                    searchTodo: _searchTodo),
                Todolist(
                  todos: _foundedTodo,
                  handleToDoChange: _handleToDoChange,
                  handleToDoDeleted: _handleToDoDeleted,
                ),
              ],
            ),
          ),
          BottomStack(
            todoController: _todoController,
            addtodoItem: _addtodoItem,
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
            widget.title,
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
