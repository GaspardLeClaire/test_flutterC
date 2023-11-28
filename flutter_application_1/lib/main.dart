import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/music_icon_icons.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/next_page.dart';
import 'package:flutter_application_1/screens/setting.dart';
import 'package:json_theme/json_theme.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter/services.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeStr = await rootBundle.loadString('assets/appainter_theme.json');

  final themeJson = jsonDecode(themeStr);

  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  runApp(MyApp(theme : theme));
}

class MyApp extends StatelessWidget {
  final ThemeData theme;

  const MyApp({Key? key, required this.theme}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const MyHomePage(title: 'Tp 1 FLUTTER'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int currentPageIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter(){
    setState(() {
      _counter--;
    });
  }
  void _resetCounter(){
    setState(() {
      _counter = 0;
    });
  }

  void _randomCounter(){
    setState(() {
      _counter = Random().nextInt(100);
    });
  }

   _getDrawerItemWidget(int pos) {
      switch (pos) {

      case 0:
      return new HomeBody();
      case 1: 
      return new NextPageBody();

      case 2:
      return new ParamBody();  //Nom de votre StatefulWidget dans votre fichier Paramètre

      //Autres case à réaliser

      default:
      return new Text('Erreur de page');

      }
   }

    @override
    void initState() {
    super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      Expanded(
          child: Scaffold(
            body: _getDrawerItemWidget(currentPageIndex),
          ),
      ),
      


       NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
		        currentPageIndex = index;
        });
        },
	      selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.house),
            label: 'Accueil',
          ),
          NavigationDestination(
            icon: Icon(Icons.last_page),
            label: 'Page Suivante',
          ),
          NavigationDestination(
            selectedIcon: Icon(MusicIcon.note_beamed),
            icon: Icon(MusicIcon.music_note),
            label: 'Paramètres',
          ),
        ],
      ),
      ],
    /*
      body: <Widget>[
        Container(    
        alignment: Alignment.center,   
        child: ListView(
          children: <Widget>[
            Image.network('https://ziggyfamily.com/cdn/shop/articles/diabete-chez-le-chat.jpg', width: 375, height: 250, fit: BoxFit.scaleDown,),
            Image.asset('images/imagede.jpg', width: 375, height: 250, fit: BoxFit.scaleDown,) ,
            Container(
              alignment: Alignment.center,
              child : 
              const Text(
                'Nombre :',
              ),
            ),
            
            Container(
              alignment: Alignment.center,
              child: Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ),
          ],
        ),
      ),
      _getDrawerItemWidget(currentPageIndex)
      ][currentPageIndex],*/

    
      /*floatingActionButton: Stack(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left:31),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: FloatingActionButton(
            onPressed: _decrementCounter,
            child: Icon(Icons.remove),),
        ),),

        Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: _incrementCounter,
          child: Icon(Icons.add),),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            onPressed: _resetCounter,
          child: Icon(Icons.refresh),),
        ),
      ],
      )   */     
    );
    
  }
}
