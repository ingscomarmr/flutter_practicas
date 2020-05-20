import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle; //solo importamos el paquete especifico

class _MenuProvider{
  List<dynamic> opciones =  [];

  _MenuProvider(){
    cargarData();
  }  
    

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');    
    Map dataMap = json.decode( resp );
    //print(dataMap['rutas']);
    opciones = dataMap['rutas'];

    return opciones;
  }
}

//como la clase es privada, solo se exponer una instancia de la misma
final menuProvider = new _MenuProvider();
    