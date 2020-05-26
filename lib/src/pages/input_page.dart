import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInputs(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInputs() {
    return  TextField(
      autofocus: true, //para enfocar
      decoration: InputDecoration(
        border: OutlineInputBorder( //por defecto tiene el underline que solo es de linea, pero con este border encierra el unput
          borderRadius: BorderRadius.circular(10.0)
        ),
        counter: Text('Letra(s) ${ _nombre.length }'),
        hintText: 'Nombre de la persona', //es como un placeholder
        labelText: 'Nombre', //titulo para que vea el usuario lo que va introducir
        helperText: 'Inicie con el nombre y luego apellidos', //texto de ayuda para el usuario
        suffixIcon: Icon(Icons.person), //icono que sale al final
        icon: Icon(Icons.text_fields), //icono que sale al inicio del input        
      ),
      onChanged: (valor){        
        setState(() {
          _nombre = valor;  
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre:$_nombre'),
    );
  }
}