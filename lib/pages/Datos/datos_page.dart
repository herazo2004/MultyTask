import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class DatosPage extends StatefulWidget {
  DatosPage({Key? key}) : super(key: key);

  @override
  State<DatosPage> createState() => _DatosPageState();
}

class _DatosPageState extends State<DatosPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    realizarPeticion();

  }

    Future<void> realizarPeticion() async {
      Uri uir = Uri.https("jsonplaceholder.typicode.com","/posts/");
      dynamic datos = await http.get(uir);
      dynamic listaPost = jsonDecode(datos.body);
      posts = listaPost;
      setState(() {
        
      });
  }


  reload() async {
    posts = [];
    setState(() {
      
    });

    await Future.delayed(const Duration(seconds: 3));
    realizarPeticion();
    
  }

  List<dynamic> posts = []; 
  @override
  Widget build(BuildContext context) { //
    return Scaffold(appBar: AppBar(
      actions: [Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(onPressed: (){reload();}, icon: const Icon(Icons.replay)),
      )],
      centerTitle: true,
      title: const Text('Datos'),
    ),
    body: posts==[] || posts == null? Center(child: Text("Cargando...")) :
     SingleChildScrollView(
      child: Column(children: mostrarLista(),),
    ),
    );
  }

  List<Widget> mostrarLista(){
    
    List<Widget> listWidgets = [];

    posts.forEach((element) {
      listWidgets.add(
      
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(16)
                ),
            child: Column(
            
              children: [
                   Container(
                    child:  const Image(image: NetworkImage("https://picsum.photos/700/400",),width: 700,),
                  ),
                Container(
                  
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ListTile(
                      
                      title: Text("${element['id']}"+" - "+element['title'],style:const  TextStyle(color:Colors.white),),
                      subtitle:  Text("${element['userId']}"+" - "+element['body']),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      
      );
    });

    return listWidgets;
  }



}