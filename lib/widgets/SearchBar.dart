import 'package:flutter/material.dart';
import 'package:todo_flutter/constants/colors.dart';

class SearchBar extends StatelessWidget {
  final searchController;
  final searchTodo;
  //Constructor
  const SearchBar(
      {super.key, required this.searchController, required this.searchTodo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(45),
      ),
      child: TextField(
        controller: searchController,
        onChanged: (value) => searchTodo(searchController.text),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(18),
          hintText: 'Enter Your Todo',
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
        ),
      ),
    );
  }
}
