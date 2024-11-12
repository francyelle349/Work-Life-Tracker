import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/suggestion/ui/suggestion.dart';
import 'package:flutter_application_1/features/tracker/ui/tracker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
    
      home: MyHomePage(title: "title")
    );
  }
  
}

class MyHomePage extends StatefulWidget {
   MyHomePage({super.key, required this.title});



  final String title;

  int _indiceAtual = 0; // Variável para controlar o índice das telas
  final List<Widget> _telas = [
  
  ];



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _indiceAtual = 0;
  final List<Widget> _telas = [
    TrackerPage(),
    SuggestionPage()
  ];
   void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(body: _telas[_indiceAtual], bottomNavigationBar:  BottomNavigationBar(

        items: [
          BottomNavigationBarItem(
            
            icon: Icon(Icons.timer),
            label: 'Tracker',
            
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage),
            label: 'Suggestion',
            
          ),
         
        ],
        currentIndex: _indiceAtual,
        selectedItemColor: Color.fromARGB(255,247, 177, 171),
        onTap: onTabTapped,
        
        
      ),);
    }
}