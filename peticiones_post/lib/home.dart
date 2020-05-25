import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peticiones_post/json/json.dart';
import 'package:peticiones_post/comments.dart';
import 'package:peticiones_post/menu.dart';
import 'package:peticiones_post/message.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Json> _notes = List<Json>();

  Future<List<Json>> fetchJson() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var response = await http.get(url);

    var notes = List<Json>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);

      for (var noteJson in notesJson) {
        notes.add(Json.fromJson(noteJson));
      }
    }
//Crea un atchivo llamado notes
    return notes;
  }

  @override
  void initState() {
    fetchJson().then((value) => setState(() {
          _notes.addAll(value);
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(      
        title: Text("POSTING"), 
         actions: <Widget>[
          IconButton(
             icon: new Icon (Icons.message),
              onPressed:  () {
                print("presionado");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Message()));
              },
              )
        ],  
        backgroundColor: Colors.purple,
      ),
      //el appBar es la barra superior, contiene el "titulo" y el icono de mensajes
      drawer: Menu(),
      //el drawer es el icono de menu, al presionarlo se desliza el menu y aparece lo de menu.dart
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              splashColor: Colors.deepPurple,
              onTap: () {
                print("presionado");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Comments()));
              },
              //el onTap es para cuando se presione el contenedor de cada post, nos envie a
              //una nueva pagina que contiene comentarios (comments.dart) 
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 32.0, bottom: 32.0, right: 20.0, left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                  width: 200,
                  height: 150,
                  margin: EdgeInsets.only(
                    top:10,
                    bottom: 5,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/151.png'),
                        fit: BoxFit.fill
                        ),
                  ),
                  //Crea una caja de decoracion en la cual se inserta una imagen
                ),
                //Crea un contenedor, aqui se encuentra espacificado el tamaño, el margen, 
                //la caja de decoracion y el link de la imagen
                    Text(
                      _notes[index].titulo,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),                                          
                          ),
                          //Contiene el estilo de la letra del titulo
                    Text(
                      _notes[index].texto,
                      style: TextStyle(color: Colors.blueGrey.shade600),
                    ),
                    //contiene el estilo de la letra del texto
                        new Icon (
                        Icons.add_comment,
                      color: Colors.blue,
                      ),
                      //crea un icono de agregar comentarios
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: _notes.length,
      ),
      //Crea una lista que muestra los posts
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        backgroundColor: Colors.purple,
        onPressed: () {
          print("presionado");
        },
      ),
      //Crea un boton flotante para agregar iamagenes
    );
  }
}
