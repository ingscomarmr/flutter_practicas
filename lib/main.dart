
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';

import 'package:componentes/src/pages/alert_page.dart';
//import 'package:componentes/pages/home_temp.dart';  para muestas
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      //para rutas dinamicas lo quitamos home: HomePage(),  //HomePageTemp(), usamos esta para muesta
      initialRoute: "home",
      routes: getAppRoutes(),
      onGenerateRoute: (RouteSettings settings){
        //metodo para rederizar a una pagina cuando no se encuentra la ruta
        print("Render ruta no encontrada:${ settings.name }");
        return MaterialPageRoute( //con este indicamos a que pagina se va
          builder: (BuildContext context) => AlertPage()
        );
      },
    );
    
  }
}