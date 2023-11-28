import 'dart:html';
import 'dart:js_interop';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/music_icon_icons.dart';

class NextPageBody extends StatefulWidget {
  const NextPageBody({Key? key}) : super(key: key);
  @override
  State<NextPageBody> createState() => _NextPageBody();
}

class _NextPageBody extends State<NextPageBody> {
  int _counter = 0;
  int x = 0;
  int y = 0;
  String solution = "";
  List<String> _listeNombre = ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20'];
  int _indexDropDown = -1;
  int valueDropDown = 1;

  void remplirListe(){
    var listNombre = [];
    for(var i;i<20;i++){
      listNombre[i] = i;
    }
    
  }
  

  void _randomCounter() {
    setState(() {
      x = Random().nextInt(100);
      y = Random().nextInt(100);
      _counter = x + y;
    });
  }

  	void _showToast(BuildContext context, String _message) {
	    final scaffold = ScaffoldMessenger.of(context);
      if(int.parse(solution) == x + y){
        scaffold.showSnackBar(
	      SnackBar(
	        content: Text("Vous avez réussi ! "),
	      ),
	    );
      }
      else{
        scaffold.showSnackBar(
	      SnackBar(
	        content: Text("Essayer encore"),
	      ),
        );
      }
	    
	  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$x + $y',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          ElevatedButton(
              onPressed: () => _randomCounter(),
              child: Text("Générer un nombre aléatoire")),
          TextField(
            keyboardType: TextInputType.number,
            maxLength: 25,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            decoration: const InputDecoration(
                labelText: 'Entrer la solution',
                hintText: 'Entrer un nombre',
                border: OutlineInputBorder()),
            onChanged: (value) {
              solution = value;
            },
          ),
          DropdownButton(
            icon: Icon(Icons.on_device_training),
            value: valueDropDown.toString(),                
            items: _listeNombre.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            onChanged: (value) {
              setState(() {
                valueDropDown = int.parse(value!) ;
              });
              
            },

          ),

          ElevatedButton(
              onPressed: () => _showToast(context,solution),
              child: Text("Valider")),
        ],
      ),
    );
  }
}



/*Container(
        color: Colors.green,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            ElevatedButton(onPressed: ()=> _randomCounter(), child: Text("Générer un nombre aléatoire")),
          ],

      ),)*/