import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = "";
  String _email = "";
  String _fecha = "";
  String _genero = "Masculino";
  List <String> _generoList =["Masculino", "Femenino"];

  //para poder manejar el valor de la fecha y ponerlo se utiliza controllers
  TextEditingController _fechaTextEditingController = new TextEditingController();


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
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha( context ),
          Divider(),
          _crearDropDown(),  
          Divider(),        
          _crearPersona(),
          Divider(),          
        ],
      ),
    );
  }


  // ############################## GENERO DROPDONW  ##############################
  List<DropdownMenuItem<String>> _getGeneroOptionsDmi(){

    List<DropdownMenuItem<String>> generoItemsDmiList = List(); //puede ur new o no 
    //otra forma del foreach
    _generoList.forEach((item) { 
      generoItemsDmiList.add(
        DropdownMenuItem( //creamos el item de la lista
          child: Text(item),
          value: item,
        )
      );
    });

    return generoItemsDmiList;
  }

  Widget _crearDropDown() {

    return Row( //para que quede mas ordendado en espacios ponemos un row
      children: <Widget>[
        Icon(Icons.menu),
        SizedBox(width: 30.0,),
        DropdownButton(
          items: _getGeneroOptionsDmi(),
          value: _genero,
          onChanged: (opt){
            setState(() {
              print('Genero: $opt');
              _genero = opt;
            });
            
          },
        ),
      ],
    );

  }

  // ############################## NOMBRE INPUT  ##############################
  Widget _crearInputs() {
    return  TextField(
      textCapitalization: TextCapitalization.sentences, //para que ponga en mayus cada palabra
      //autofocus: true, para enfocar
      decoration: InputDecoration(
        border: OutlineInputBorder( //por defecto tiene el underline que solo es de linea, pero con este border encierra el unput
          borderRadius: BorderRadius.circular(10.0)
        ),
        counter: Text('Letra(s) ${ _nombre.length }'),
        hintText: 'Su nombre nombre', //es como un placeholder
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

  // ############################## RESULTADO NOMBRE Y EMAIL LISTTITLE  ##############################
  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre:$_nombre'),
      subtitle: Text('Email:$_email'),
      trailing: Text('$_genero'),
    );
  }

  Widget _crearEmail() {
    return  TextField(
      keyboardType: TextInputType.emailAddress,      //de esta forma le decimos que este input es de una direccion de email
      decoration: InputDecoration(
        border: OutlineInputBorder( //por defecto tiene el underline que solo es de linea, pero con este border encierra el unput
          borderRadius: BorderRadius.circular(10.0)
        ),        
        hintText: 'Email', //es como un placeholder
        labelText: 'Email', //titulo para que vea el usuario lo que va introducir        
        suffixIcon: Icon(Icons.alternate_email), //icono que sale al final
        icon: Icon(Icons.email), //icono que sale al inicio del input        
      ),
      onChanged: (valor){        
        setState(() {
          _email = valor;  
        });
      },
    );
  }

  // ############################## PASSWORD INPUT  ##############################
  Widget _crearPassword() {
    return  TextField(
      obscureText: true, //para que no se muestre los caracteres
      decoration: InputDecoration(
        border: OutlineInputBorder( //por defecto tiene el underline que solo es de linea, pero con este border encierra el unput
          borderRadius: BorderRadius.circular(10.0)
        ),        
        hintText: 'Tu Contraseña', //es como un placeholder
        labelText: 'Contraseña', //titulo para que vea el usuario lo que va introducir        
        helperText: 'Minimo de 8 caracteres, con por lo menos una mayuscula, un numero y un simbolo',
        suffixIcon: Icon(Icons.lock_open), //icono que sale al final
        icon: Icon(Icons.lock), //icono que sale al inicio del input        
      ),
      onChanged: (valor){        
        setState(() {
          //_email = valor;  
        });
      },
    );
  }

  // ############################## FECHA INPUT  ##############################
  Widget _crearFecha(BuildContext context) {
     return  TextField(         
      enableInteractiveSelection: false, //para que no puedan copiar el texto   
      controller: _fechaTextEditingController, //le indicamos cual es su controlador
      decoration: InputDecoration(
        border: OutlineInputBorder( //por defecto tiene el underline que solo es de linea, pero con este border encierra el unput
          borderRadius: BorderRadius.circular(10.0)
        ),                
        hintText: 'Fecha de nacimiento', //es como un placeholder
        labelText: 'Fecha de nacimiento', //titulo para que vea el usuario lo que va introducir                
        suffixIcon: Icon(Icons.lock_open), //icono que sale al final
        icon: Icon(Icons.lock), //icono que sale al inicio del input        
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _showDatePicker(context);
      },   
     );   
    
  }
  // ############################## FEHCA MODAL PICKER PARA EL INPUT  ##############################
  //para manejar el datepicker necesitamos async y awaite ya que es un future
  _showDatePicker(BuildContext context) async {
    DateTime picker = await showDatePicker(      
      helpText: 'Selecciona la fecha de tu nacimiento',
      context: context,                   //el contexto es requerido
      initialDate: new DateTime.now(),    //la fecha inicial
      firstDate: new DateTime(DateTime.now().year - 80),      //el atras que reconoce el picker para que no vaya mas atras del 2018
      lastDate: new DateTime.now()        //el tiempo maximo que alacanza el picker para que no pueda ir mas adelante
    );

    if(picker != null){
      setState(() { //para que repinte el widget
        _fecha = picker.toString(); //para guardar la fecha
        _fechaTextEditingController.text = _fecha; //le indicamos el valor que debe mostrar el campo
      });
    }
  }

}