import 'dart:async';

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
  bool _estaCargando = false;


  @override
  void initState() { //cuando inicia la etapa se ejecuta
    super.initState(); //esto es necesario
    _agregarImg();//para agregar los elementos a el index de imgs

    //vamos a estar checando el scroll por medio del scrollcontroller en el listview builder
    _scrollController.addListener(() {
      //print('Scroll!!');//se ejecuta al mover el scroll
      
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){ //cuando la posicion del scroll esta en el maximo del scroll
        //si la posicion del scroll esta en el limite se ejecuta
        //_agregarImg(); //volvemos a ejecutar el metodos        
        buscarDatos();
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
          _crearList(),
         _crearLoading(),
        ],         
      )
    );
  }

  @override
  void dispose(){ //se dispara cuando se quita la pagina
    super.dispose();
    _scrollController.dispose(); //destruimos el scroll controller
  }

  Widget _crearList(){

    return RefreshIndicator( //este widget ayuda ha que si jalas hacia abajo la lista se realice el pull
        onRefresh: _pullToRefreshImg, //para hace el pull refresh, obtiene las imagenes
        child: ListView.builder( //se utiliza cuando los elementos de una lista a mostrar pueden ser infinitos o dinamicos
          controller: _scrollController, //para poder controlar el scroll
          itemCount: _indexImgList.length, //el numero de elemento esperadados
          itemBuilder: (BuildContext context, int index){ //se encarga de redenderizar los elementos de la pagina
            final imgs = _indexImgList[index];
            return FadeInImage(          
                image: NetworkImage('https://picsum.photos/500/300/?image=$imgs'),
                placeholder: AssetImage('assets/loagin_img.gif'),
            );
          }, 
        ),
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

  //simulando future para retraso
  Future<Null> buscarDatos() async{
    _estaCargando = true;
    setState(() {
      
    });


    final duration = Duration(seconds: 3);
    return new Timer(duration, respuestaHttp);
  }

  void respuestaHttp(){
    _estaCargando = false;
    
    _scrollController.animateTo( //recorre el scroll para que enseguida se cargan las siguientes img se recorra.
      _scrollController.position.pixels + 300,       
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 750)
    );
    _agregarImg();
  }

  Widget _crearLoading() {
    if(_estaCargando){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],            
          ),
          SizedBox(),
        ],
      );
    }
    return Container();
  }

  //
  Future<Null> _pullToRefreshImg() async {

    final duracion = Duration(seconds: 2);
    new Timer(duracion, (){
      _indexImgList.clear(); //limpia la lista  
      _ultimoItem++;
      _agregarImg(); //para que cambie las imgs
    });

    return Future.delayed(duracion);
  }

}