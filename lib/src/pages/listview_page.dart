import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List<int> _numeros = [1,2,3,4,5,6,7];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: _crearList(),
    );
  }

  Widget _crearList(){
    return ListView.builder( //se utiliza cuando los elementos de una lista a mostrar pueden ser infinitos o dinamicos
      itemCount: _numeros.length, //el numero de elemento esperadados
      itemBuilder: (BuildContext context, int index){ //se encarga de redenderizar los elementos de la pagina
        final imgs = _numeros[index];
        return FadeInImage(          
            image: NetworkImage('https://picsum.photos/500/300/?image=$imgs'),
            placeholder: AssetImage('assets/loagin_img.gif'),
        );
      }, 
    );
  }

  
}