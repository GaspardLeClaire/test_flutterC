import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';

class ParamBody extends StatefulWidget {
  const ParamBody({Key? key}) : super(key: key);

  @override
  State<ParamBody> createState() => _ParamBody();
}

class _ParamBody extends State<ParamBody> {
  int currentPageIndex = 0;

  /*@override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: const Text('Paramètres'),
      );
        
  }*/

  _getDrawerItemWidget(int pos) {
      switch (pos) {
      case 0:
      return new HomeBody();  //Nom de votre StatefulWidget dans votre fichier Acceuil

      //Autres case à réaliser

      default:
      return const Text('Erreur de page');
      }
      }
    @override
    void initState() {
    super.initState();
    }
    @override
    


  Widget build(BuildContext context) {
    return  Column(
      children: [
      AppBar(
        key: const Key('appBarPrincipale'),
        title: const Text('Aléatoire et Dés'),
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
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.gamepad),
            label: 'Paramètres',
          ),
        ],
      )
      ],
      );
      }
}



