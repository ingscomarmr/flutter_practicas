
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedPage extends StatefulWidget {  
  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {

  double _width = 50.0;
  double _heigth = 50.0;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer( //un continer por un animatedcontainer solo requiere un duration.
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn, //para animacion predefinida
          height: _heigth,         
          width: _width,          
          decoration: BoxDecoration(
            borderRadius: _borderRadiusGeometry,
            color: _color,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _repintarAnimacion,
        child: Icon(Icons.play_arrow),        
      ),
    );
  }

  void _repintarAnimacion(){

    final ramdom = Random(); //para numeros aleatorios

    //el metodo setState es necesario para repintar el widget
    setState(() {
      _heigth += ramdom.nextInt(100).toDouble();
      _width += ramdom.nextInt(50).toDouble();
      _color = Color.fromARGB(
        ramdom.nextInt(255), 
        ramdom.nextInt(255), 
        ramdom.nextInt(255), 
        1);
      _borderRadiusGeometry = BorderRadius.circular(ramdom.nextInt(255).toDouble());

    });
  }


}