import 'package:flutter/material.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() =>_HomeScreenState(); 
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  int _selectedIndex=0;

  List<Widget> _screens=[
    Center(child:Text('Home Screen')),
    Center(child:Text('Profile Screen')),
    Center(child:Text('Settings Screen'))
  ];
//}

  void _onItemTapped(int index){
    setState(()=>_selectedIndex=index);
    if(index==1){
      Navigator.pushNamed(context,'/profile',
      arguments:'Hello from Home Screen');
    }
    if(index==2){
      Navigator.pushNamed(context, '/settings');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Home Screen'),
        backgroundColor: Colors.blue,
      ),
      body: _screens[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:(context)=>ProfileScreen(
                name:'Ayoob Rasheed',
                age:21,
              ),
            )
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap:_onItemTapped,
        items:const[
          BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label:"Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label:"Settings"),
        ],
      ),
    );
  }
}




