import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget{
  final String? name;
  final int? age;
  ProfileScreen({this.name,this.age});

  @override
  Widget build(BuildContext context){
    final args=ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(title:Text('Profile Screen')),
      body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Constructor Data: $name | Age: $age"),
            SizedBox(height:20),
            Text("Route Argument Data: $args"),
            SizedBox(height:20),
            ElevatedButton(
              onPressed:() => Navigator.pop(context),
              child: Text("Go Back"),
            )
          ],
        ),
      ),
    );
  }
}