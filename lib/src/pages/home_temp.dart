import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ["Uno","Dos","Tres", "#Cuatro"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes Temp"),
      ),
      body: ListView(
        children: _crearItems()        //crea los items de forma dinamica
      ),
    ) ; 
  }

  /*Un metodo mas personalizado */
  List<Widget> _crearItems(){

    List<Widget> lista = new List<Widget>();

    for (var item in opciones) {
      final itemWidget = ListTile(
        title: Text(item),
        subtitle: Text("SubTitulo"),
        leading: Icon(Icons.menu), //icono del inicio
        trailing: Icon(Icons.keyboard_arrow_right), //icono del final
        onTap: (){}, //este es el metodo que se ejecuta al realizar clic
      );

      lista.add(itemWidget);
      lista.add(Divider());

    }

    return lista;
  }

  /*Un medoto mas comodo y rapido */
  List<Widget> _crearItems2(){
    return opciones.map((item){
      return Column(
        children: <Widget>[
          ListTile(
            title: Center(
              child: Text('$item!'),
            ),
          ),
          Divider()
        ],
      );
    }).toList();
  } 

}