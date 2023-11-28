import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Album.dart';

class ParamBody extends StatefulWidget {
  const ParamBody({Key? key}) : super(key: key);

  @override
  State<ParamBody> createState() => _ParamBody();
}

class _ParamBody extends State<ParamBody> {

  @override
    void initState() {
    super.initState();
    List<Album> liste = [Album(
                  nomAlbum: "Metallica",
                  description: "L'album marque une évolution importante dans le style du groupe. Les tempos sont plus lents, les morceaux plus courts et leurs structures beaucoup plus simples, aspirant ainsi à du simple rock. C'est principalement un album de heavy metal, et il n'y a plus beaucoup de traces de thrash metal. ",
                  nomGroupe: "Metallica",
                  image: "Metallica.jpg",
                  ),
                  Album(
                  nomAlbum: "Ride the lightning",
                  description: "Ride the lightning est considéré comme l'un des classiques du trash metal et comme une transition musicale entre les débuts de Metallica, Kill'em All et Master of Puppets, plus mélodique et progressif",
                  nomGroupe: "Metallica",
                  image: "Ride_the_lightning.jpg",
                  ), ]; 
    }


  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: ListView(
        shrinkWrap: true, padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0), 
            children: <Widget> [
               for(var i;i<liste)
            ],
), 
    );       
  }
}
