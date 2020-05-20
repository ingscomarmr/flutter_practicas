import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1()
        ],
      ),
    );
  }

  Widget _cardTipo1(){
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Tarjeta 1 de Omar Munguia'),
            subtitle: Text('Texto largo para probar si la tarjeta contiene todo este texto y ver sus limites'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: (){}, child: Text('Ok')),
              FlatButton(onPressed: (){}, child: Text('Cancelar')),
            ],
          ),
        ],
      ),
    );
  }

}