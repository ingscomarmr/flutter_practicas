import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar'),
        actions: <Widget>[ //acciones del app var     
          Container(
            margin: EdgeInsets.all(7.0), //para mejorar el ciculo de la imagen
            child: CircleAvatar(                          
              backgroundImage: NetworkImage('https://www.cinemascomics.com/wp-content/uploads/2015/01/neytiri-avatar.jpg?width=1200&enable=upscale'),
            ),
          ), 
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(            
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/avatar-zoe-saldana-1547587115.jpg?crop=1.00xw:0.891xh;0,0.0364xh&resize=980:*'),
          placeholder: AssetImage('assets/loagin_img.gif'),
          fadeOutDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}