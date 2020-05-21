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
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
           _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
           _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
        ],
      ),
    );
  }

  Widget _cardTipo1(){
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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

  Widget _cardTipo2(){
    final myCard = Container(      
      child: Column(
        children: <Widget>[
          
          /*
          Image( //para cargar una imagen por medio de una url, aun que suele tardar y por eso se ocupa un fadeimage      
            image: NetworkImage('https://www.publicdomainpictures.net/pictures/30000/velka/evening-landscape-13530956185Aw.jpg'),
          ),*/
          FadeInImage( //mas practico para mostrar imagenes que son de internet
            image: NetworkImage('https://www.publicdomainpictures.net/pictures/30000/velka/evening-landscape-13530956185Aw.jpg'),
            placeholder: AssetImage('assets/loagin_img.gif'), //img que se queda hasta que el recurso esta esta listo
            fadeOutDuration: Duration( milliseconds: 200 ),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            child: Text('Algo que tengo..')
          )
        ],
      ),
    );

    return Container(            
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),        
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0,10.0)
          )          
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: myCard,        
      ),      
    );

  }


}