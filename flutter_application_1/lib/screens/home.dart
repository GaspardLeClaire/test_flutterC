import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBody();
}

class _HomeBody extends State<HomeBody> {
  int _counter = 0;
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


  @override
    void initState() {
    super.initState();
    }


  @override
  Widget build(BuildContext context) {
    return Container(    
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
      );
        
  }
}

        