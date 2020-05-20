
import 'package:flutter/material.dart';

import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';




class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _listViewWidget(),
    );
  }

  //crear una lista dinamica 
  Widget _listViewWidget() {
    //print(menuProvider.opciones);
    
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        print(snapshot.data);

        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );

  /*  return ListView(
      children: _listItems(),
    );*/
  }

  //retorna los list items      
  List<Widget> _listItems(List<dynamic> data, BuildContext context) {

    final List<Widget> opciones = [];

    data.forEach((o) {
      final widgetTemp = ListTile(
        title: Text(o['texto']),
        leading: getIcon(o['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: (){

          //crear la ruta de la pagina
          final route = MaterialPageRoute(builder: (context){
            return AlertPage();
          });
          //para mandar a otra pagina
          Navigator.push(context, route);

        },
      );

      opciones.add(widgetTemp);
      opciones.add(Divider());

    });
    return opciones;
  }


  
}