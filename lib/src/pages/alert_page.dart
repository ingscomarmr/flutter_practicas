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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), //darle un stylo menos cuadrado a los bordes
          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min, //para que la columna se adapte al contenido
            children: <Widget>[
              Text('Contenido de la alerta....'),
              FlutterLogo(size: 100.0)
            ],            
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: ()=> Navigator.of(context).pop(), //para cerrar el arlert
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: (){
                Navigator.of(context).pop(); //para cerrar el arlert
              } 
            ),
          ],
        );
      }
    );
  }


}