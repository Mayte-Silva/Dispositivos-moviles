import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MESSAGE"),
        actions: <Widget>[
          IconButton(
             icon: new Icon (Icons.account_circle),
              onPressed: (){},
              )
              //Crea un boton con el icono de usuario
        ], 
        backgroundColor: Colors.purple,    
        ),
        //Crea la barra superior 
        body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              splashColor: Colors.deepPurple,
              onTap: () {
              },
        child: Padding (
          padding: const EdgeInsets.only(
                    top: 32.0, bottom: 32.0, right: 10.0, left: 20.0),
                    child: Column(
                      children: <Widget>[
           ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Jayne_Kuhic@sydney.com',
            ),
            subtitle: Text(
              'harum non quasi et ratione\ntempore iure ex voluptates in ratione\nharum architecto fugit inventore cupiditate\nvoluptates magni quo et',
            ), 
                        trailing: Icon(Icons.more_vert),
            onTap: null,
          ),
          //crea una lista interactiva con texto e iconos
        ],
        ),
          ),
          //crea un padding y aqui se especifican las caracteristicas del recuadro
            ),
          );
        },
        ),
        //crea una lista con los mensajes
    );
    //Crea un boton para regresar al inicio
  }

}