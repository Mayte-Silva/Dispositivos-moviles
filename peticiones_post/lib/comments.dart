import 'package:flutter/material.dart';
import 'package:peticiones_post/home.dart';
import 'package:peticiones_post/message.dart';

class Comments extends StatelessWidget {
  const Comments({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COMMENTS"),
        actions: <Widget>[
            IconButton(
             icon: new Icon (Icons.message),
               onPressed:  () {
                print("presionado");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Message()));
              },
              //cuando se presiona el icono de mensaje nos manda una nueva pagina que es: message.dart
              )
              //Crea un boton con el icono de mensaje
        ], 
        backgroundColor: Colors.purple,    
        ),
        //Crea la barra superior con el titulo e iconos
        body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              splashColor: Colors.deepPurple,
              onTap: () {
                print("presionado");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Home()));
              },
        child: Padding (
          padding: const EdgeInsets.only(
                    top: 32.0, bottom: 32.0, right: 20.0, left: 20.0),
                    child: Column(
                      children: <Widget>[
           ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'name: id labore ex et quam laborum',
            ),
            subtitle: Text(
              'laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium',
            ), 
                        trailing: Icon(Icons.more_vert),
            onTap: null,
          ),
          //crea una lista interactiva
            new Icon (
                  Icons.add_comment,
                   color: Colors.blue,
             ),
        ],
        //se crea el widget y adentro contiene una lista 
        ),
          ),
          //Crea un padding y en esta parte se specifican las caracteristicas
            ),
          );
          //regresa varios comentarios
        },
        ),
        //crea una lista con los comentarios
    );
    //Crea un boton para regresar al inicio
  }

}