// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle estiloTitulos = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.pinkAccent,
    fontSize: 19,
  );

int valorTemp = 0;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.home_rounded,
              color: Colors.pinkAccent,
              size: 80,
            ),
            Text(
              'BIENVENIDOS',
              style: estiloTitulos,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Navega entre las distintas opciones del Menu.',
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      color: Colors.pinkAccent,
                      fontSize: 15)),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "WomenShop",
          style: TextStyle(
              fontWeight: FontWeight.w100,
              color: Colors.white,
              fontFamily: 'SchDancingScriptyler',
              fontSize: 25),
        ),
        elevation: 0,
        backgroundColor: Colors.pinkAccent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Menu',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent),
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    
                    SizedBox(
                      height: 25,
                    ),

                    ListTile(
                      title: Text('Calculadora'),
                      subtitle: Text('Calcula lo que quieras.'),
                      leading: Icon(Icons.calculate),
                      onTap: () {
                        Navigator.pushNamed(context, 'Calculadora');
                      },
                    ),

                    Divider(),

                    ListTile(
                      title: Text('Formularios'),
                      subtitle: Text('Escribe lo que quieras'),
                      leading: Icon(Icons.accessibility_new),
                      onTap: () {
                        Navigator.pushNamed(context, 'Formulario');
                      },
                    ),

                    Divider(),

                    ListTile(
                      title: Text('Animacion'),
                      subtitle: Text('Diseña tu futuro'),
                      leading: Icon(Icons.home_max_outlined),
                      onTap: () {
                        Navigator.pushNamed(context, 'Animacion');
                      },
                    ),

                    Divider(),

                    ListTile(
                      title: Text('Datos'),
                      subtitle: Text('Peticion HTTP'),
                      leading: Icon(Icons.file_download_done),
                      onTap: () {
                     Navigator.pushNamed(context, 'Datos');
                      },
                    ),
                    Divider(),

                    ListTile(
                      title: Text('Temporizador'),
                      subtitle: Text('Divide tu tiempo'),
                      leading: Icon(Icons.timer),
                      onTap: () {
                        showDialog(context: context, builder: (context){  

                            return AlertDialog(
                              content: Column(
                                
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      onChanged: (valor){
                                        valorTemp = int.parse(valor);
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: (){
                                        Navigator.pushNamed(context, 'Temporizador',arguments: valorTemp);
                                      }, 
                                      child: Text('Empezar')
                                    ),
                                  ),
                                ],
                              ),
                            );

                        });
                      },
                    )

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
