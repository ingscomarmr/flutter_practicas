import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 200.0; //para el slider metemos este valor dentro de los limites
  bool _bloquearSlider = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
      ),
      body: Container(
        padding: EdgeInsets.only(top:50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            _crearImagen(),
            //Expanded(child: _crearImagen()), //Expanded para que ocupe todo el spacio disponible
          ],
        ),
      ),
    );        
  }

  // ##################################### SLIDER #####################################
  Widget _crearSlider() {
    return Slider(
      value: _valorSlider, //este valor debe estar entre el minumo y maximo
      min: 50, //valor min
      max: 500, //valor tope
      activeColor: Colors.red, //para poner el color de del control
      divisions: 100, //para diviciones marcadas cada cierto puntaje
      label: 'Tamaño de la imagen $_valorSlider', //al seleccionarlo muestra este titulo      
      onChanged: _bloquearSlider? null : (valor){ //si la funcion es null se bloquea el slider por eso el uso de un if ternario
        setState(() {
          _valorSlider = valor;
          //print('Valor del slider:$_valorSlider');
        });
      }
    );
  }

  // ##################################### Image #####################################
  Widget _crearImagen() {
    return Image(
      image: AssetImage('assets/Pedifo01.PNG'), //img que se queda hasta que el recurso esta esta listo
      fit: BoxFit.contain, //para que no se salga de su paredes
      width: _valorSlider, //para ajustar la img segun el valor del slider
    );
  }

  // ##################################### Checkbox y CheckboxListTitle #####################################
  Widget _crearCheckBox() {
    return CheckboxListTile( //a diferencia del check, este viene preparado con un titulo
      title: Text('Bloquear Slider'),
      value: _bloquearSlider,      
      onChanged: (v){
        setState(() {
          _bloquearSlider = v;
        });
      },
    );
    /*Checkbox( //check muy simple
      value: _bloquearSlider,      
      onChanged: (v){
        setState(() {
          _bloquearSlider = v;
        });
      },
    );*/
  }

  // ##################################### Switch #####################################
  Widget _crearSwitch() {
    return SwitchListTile( //muy similar al CheckboxListTile
      title: Text('Bloquear Slider'),
      value: _bloquearSlider,
      onChanged: (v){
        setState(() {
          _bloquearSlider = v;
        });
      },
    );
  }

}