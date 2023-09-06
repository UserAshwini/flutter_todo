
class Todo {
  String? id;
  String? todoText;
  bool isDone = false;


  Todo({
  required this.id,
  required this.todoText,
  this.isDone = false,
});

static List<Todo> todoList() {
  return[
    Todo(id: '01', todoText: 'Eat', isDone: true),
    Todo(id: '02', todoText: 'Sleep', isDone: true),
    Todo(id: '05', todoText: 'Dinner'),
    Todo(id: '06', todoText: 'Interview',isDone: true),
  ];
}
}
