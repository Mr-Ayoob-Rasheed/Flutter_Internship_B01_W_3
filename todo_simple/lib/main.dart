import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(),
    );
  }
}

class TodoPage extends StatefulWidget{
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage>{
  List<String> todos = [];
  TextEditingController todoController = TextEditingController();

  @override
  void dispose() {
    todoController.dispose();
    super.dispose();
  }

  void addTodo(){
    String text = todoController.text;
    if(text.isNotEmpty){
      setState((){
        todos.add(text);
      });
      todoController.clear();
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:Text("To Do")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: todoController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter task...",
                    ),
                  ),
                ),
                SizedBox(width:10),
                ElevatedButton(onPressed: addTodo, child: Text('Add')),
              ],
            ),
          ),
          // Simple list to show added todos
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(todos[index]),
                  onTap:(){
                    setState(() {
                      todos.removeAt(index);
                    });
                  }
                  );
              },
            ),
          ),
        ],
      ),
    );
  }


}
