import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../classes/animal.dart';
import '../pages/animal_form_page.dart';

class CardViewAnimal extends StatelessWidget{
  Animal animal;
  BuildContext context;
  CardViewAnimal(this.animal, this.context);
  @override
  Widget build(BuildContext context) {
    return InkWell (
      onTap: (){
        Navigator.push(context,
        MaterialPageRoute(builder: (context)=>FormAnimal('Editar animal', animal)));
      },

    child: Card(
      child: Column(
        children: <Widget>[
          Container(
            height: 144.0,
            width: 500.0,
            color: Colors.green[200],
            child: FadeInImage.assetNetwork(
                placeholder: "img/mascota.jpg",
                image: animal.image,
                height: 144.0,
                width: 160.0,
            ),

          ),
          Padding(
            padding: EdgeInsets.all(7.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Icon(Icons.pets),
                ),
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(animal.name, style: TextStyle(fontSize: 18.0))
                ),
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Icon(Icons.cake),
                ),
                Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Text(animal.age, style: TextStyle(fontSize: 18.0))
                ),
              ],
            )
          )
        ],
      )
    ));
  }

}