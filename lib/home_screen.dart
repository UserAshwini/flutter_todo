import 'package:flutter/material.dart';
import 'package:flutter_todo/todo.dart';
import 'todo_items.dart';
import 'color.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
            color: tdBGColorup, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Welcome',
                style: TextStyle(
                    color: tdBlack, fontSize: 30, fontWeight: FontWeight.w800),
              ),
              Container(
                height: 50,
                width: 50,
                child: Image.asset('assets/image.png'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BodyPart();
  }
}

class BodyPart extends StatefulWidget {
  BodyPart({super.key});

  @override
  State<BodyPart> createState() => _BodyPartState();
}

class _BodyPartState extends State<BodyPart> {

  final todosList = Todo.todoList();
  final _todoController = TextEditingController();

  void _handleTodoChange(Todo todo) {
  setState((){
    todo.isDone = !todo.isDone;
  });
}

void _deleteTodoItem(String id){
  setState((){
    todosList.removeWhere((item) => item.id == id);
  });
}

void _addTodoItem(String text){
  setState((){
    todosList.add(Todo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: text));
  });
  _todoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              children: [
                Expanded(
                  child: ListView(children: [
                    Container(
                      child: Text(
                        'All TODOS',
                        style: TextStyle(
                          fontSize: 35,
                          color: tdRed,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    for (Todo toddo in todosList)
                      TodoItems(
                        todo: toddo,
                        onTodoChanged: _handleTodoChange,
                        onDeleteItems: _deleteTodoItem,
                      ),
                  ]),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(right: 15, left: 15, bottom: 15),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: tdLavender,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _todoController,
                  decoration: InputDecoration(
                      hintText: 'Add on',
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              )),
              Container(
                margin: EdgeInsets.only(right: 15, left: 15, bottom: 15),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: tdRed,
                    ),
                    child: Text(
                      '+',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.w900),
                    ),
                    onPressed: () {
                      _addTodoItem(_todoController.text);
                    },),
              )
            ],
          ),
        )
      ],
    );
  }
}






