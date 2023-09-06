import 'package:flutter/material.dart';
import 'package:flutter_todo/todo.dart';

import 'color.dart';


class TodoItems extends StatelessWidget {
  const TodoItems({super.key, required this.todo, this.onTodoChanged, this.onDeleteItems});

  final Todo todo;
  final onTodoChanged;
  final onDeleteItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10,top: 10),
      child: ListTile(
        onTap: (){
          print("tapped");
          onTodoChanged(todo);
        },
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        tileColor: tdLavender,
        leading:  Icon(todo.isDone?  Icons.check_box : Icons.check_box_outline_blank, color: tdOrchid,),
        title: Text(todo.todoText!,
        style: TextStyle(
          fontSize: 16,
          color: tdBlack,
        ),),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdMauve,
            borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(
            onPressed: (){
              print("tapp");
              onDeleteItems(todo.id);
            },
            color: Colors.white,
            iconSize: 20,
            icon: Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}