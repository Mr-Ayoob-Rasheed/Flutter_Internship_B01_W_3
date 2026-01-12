import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget{
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage>{

  int counter = 0;

  void increment(){
    setState(() {
      counter++;
    });
  }

  void decrement(){
    setState(() {
      counter--;
    });
  }

  void reset(){
    setState(() {
      counter=0;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Counter App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Count:", style: TextStyle(fontSize: 24)),
            Text("$counter", style: const TextStyle(fontSize: 40)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: increment, child: const Text("Increment")),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: decrement, child: const Text("Decrement")),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: reset, child: const Text("Reset")),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
