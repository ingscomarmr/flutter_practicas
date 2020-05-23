import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alertas'),        
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_arrow_left),
        onPressed: (){
          Navigator.pop(context); //para regresar a la pesataña anterior
        }
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed:() => _mostrarAlerta(context), //para mandar un parametro a un metodo         
        ),
      ),
    );
  }


  void _mostrarAlerta(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,//si haces clic fuera de la alerta se cierra
      builder: (context){
        return AlertDialog( //simple alerta
          title: Text('Titulo'),
          content: Text('Contenido...'),
        );
      }
    );
  }


}