import 'package:flutter/material.dart';
import 'package:peticiones_post/home.dart';

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column (
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.purple,
            child: Center (
              child: Column(children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(
                    top:30,
                    bottom: 10,
                  ),
                  //aqui se especifican las medidas del margen 
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://www.pradipdebnath.com/wp-content/themes/pradip/images/sayanaditya.jpg'),
                        fit: BoxFit.fill
                        ),
                        //aqui se especifica la imagen que se insertara
                  ),
                  //aqui se especifica la forma del contenedor para la imagen
                ),
                //Se crea un contenedor para la imagen y el texto correspondiente
                Text(
                  'Mario Martinez',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                  //Aqui se especifica el estilo del texto, es decir, numero y color de la letra
                ),
                //Aqui se escribe el texto y tambien tiene el textstyle
                Text(
                  'Mario@hotmail.com',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  //Aqui se especifica el estilo del texto, es decir, numero y color de la letra
                ),
                //Aqui se escribe el texto y tambien tiene el textstyle
              ],
             ),
            ),
          ),
          //Se crea un contenedor para el menu
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 18,
              ),
              //Aqui se especifica el estilo de la letra
            ),
            onTap: null,
          ),
          //Se escribe el texto que se vera en el boton de la lista 
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 18,
              ),
              //Especifica el estilo de la letra
            ),
            //Se escribe el texto que se vera en el boton de la lista 
            onTap: null,
          ),
          //Crea un boton en forma de lista
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 18,
              ),
              //Especifica el estilo de la letra
            ),
            //Se escribe el texto que se vera en el boton de la lista 
            onTap: () {
              print("presionado");
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => Home()));
            },
            //al preionar el boton de home me enviara a la pagina de los posts (home.dart)
          ),
           ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
              ),
              //Especifica el estilo de la letra
            ),
            //Se escribe el texto que se vera en el boton de la lista 
            onTap: null,
          ),
          //Se escribe el texto que se vera en el boton de la lista 
        ],
      ),
    );
    //el drawer es un menu despazable 
  }

}