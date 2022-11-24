class Todo {
  //Initialising a Variable to Create a todo Item
  String text;
  int? id;
  bool isDone;

//Initialising a Constructor
  Todo({this.id, required this.text, this.isDone = false});

  static List<Todo> todoList() {
    return [
      Todo(id: 1, text: "BUY CHOCOLATES", isDone: true),
      Todo(id: 2, text: "BUY BOOKS", isDone: false),
      Todo(id: 3, text: "BUY PEN", isDone: false),
      Todo(id: 4, text: "BUY POUCH", isDone: false),
      Todo(id: 5, text: "BUY BAGS", isDone: false),
    ];
  }
}
