import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _scrollController = ScrollController();

  List<int> _indexImgList = List();
  int _ultimoItem = 0;

  @override
  void initState() { //cuando inicia la etapa se ejecuta
    super.initState(); //esto es necesario
    _agregarImg();//para agregar los elementos a el index de imgs

    //vamos a estar checando el scroll por medio del scrollcontroller en el listview builder
    _scrollController.addListener(() {
      //print('Scroll!!');//se ejecuta al mover el scroll
      
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){ //cuando la posicion del scroll esta en el maximo del scroll
        //si la posicion del scroll esta en el limite se ejecuta
        _agregarImg(); //volvemos a ejecutar el metodos        
      }

    });
  }


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
      controller: _scrollController, //para poder controlar el scroll
      itemCount: _indexImgList.length, //el numero de elemento esperadados
      itemBuilder: (BuildContext context, int index){ //se encarga de redenderizar los elementos de la pagina
        final imgs = _indexImgList[index];
        return FadeInImage(          
            image: NetworkImage('https://picsum.photos/500/300/?image=$imgs'),
            placeholder: AssetImage('assets/loagin_img.gif'),
        );
      }, 
    );
  }

  
  void _agregarImg(){
    for(var i = 0; i < 10; i++){
      _ultimoItem++;
      _indexImgList.add(_ultimoItem);
    }

    setState(() {
      
    });
  }

}