import 'dart:math';

import 'package:flutter/material.dart';


class AnimacionPage extends StatefulWidget {
  const AnimacionPage({Key? key}) : super(key: key);

  @override
  State<AnimacionPage> createState() => _AnimacionPageState();
}

class _AnimacionPageState extends State<AnimacionPage> {

String figure = 'RECTANGULO';

  double ladoAnCuadrado = 100;
  double ladoAlCuadrado = 100;

  double radioCircular = 100;

  double ladoAnRectangulo = 200;
  double ladoAlRectangulo = 100;
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: IconButton(
            
            icon: const Icon (Icons.arrow_back),
            onPressed:(){
              Navigator.pop(context);
            }
          ),
        )
      ],
      centerTitle: true,
      title: Text('Animate a crear un $figure'),
      backgroundColor: Colors.red,
      
    ),


    body: figure == 'CUADRADO'?cuadrado():  figure == 'CIRCULO'? circulo(): figure == 'RECTANGULO'? rectangulo():const Text("Error"),

    floatingActionButton:FloatingActionButton(
      child: const Icon(Icons.cached_rounded),
      onPressed: (){

        generarNumeroAleatorio();         

      } ,),
      drawer: Drawer(

        child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children:  [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile( 
                title: const Text ('CUADRADO'), 
                subtitle:const Text('Mide tu cuadrado'), 
                trailing: const Icon(Icons.crop_square),       
                onTap: (){
                  figure = 'CUADRADO';
                    Navigator.pop(context);
                  setState(() {
                    
                  });
                },  
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile( 
                title: const Text ('CIRCULO'), 
                subtitle:const Text('mide tu radio'), 
                trailing: const Icon(Icons.circle),
                 onTap: (){
                   figure = 'CIRCULO';
                     Navigator.pop(context);
                   setState(() {
                    
                  });
                },     
              ),
            ),
            Padding(
              padding:const EdgeInsets.all(10),
              child: ListTile( 
                title: const Text ('RECTANGULO'), 
                subtitle: const Text('Mide tu rectangulo'), 
                trailing:  const Icon(Icons.recent_actors_outlined),
                 onTap: (){
                    figure = 'RECTANGULO';
                    Navigator.pop(context);
                    setState(() {
                    
                  });
                },           
              ),
            )
          ],
        ),
      ),
      
      ),
    );
  }


  void generarNumeroAleatorio(){

   int max = 500;
   int min = 1;
   Random rnd = Random();
   int numeroRamdon = min + rnd.nextInt(max - min);
   int numeroRamdon2 = min + rnd.nextInt(max - min);

    if(figure == "CUADRADO"){

      ladoAlCuadrado = double.parse(numeroRamdon.toString());
      ladoAnCuadrado = double.parse(numeroRamdon.toString());
        setState(() {
          
        });
    } 


    if(figure == "RECTANGULO"){
      ladoAlRectangulo = double.parse(numeroRamdon.toString());
      ladoAnRectangulo = double.parse(numeroRamdon2.toString());
      setState(() {
        
      });
    } 

    if (figure == "CIRCULO"){
      radioCircular = double.parse(numeroRamdon.toString());
      setState(() {
        
      });
    }
    
    

  }

  Widget cuadrado(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const  Duration(seconds: 1),
            color:  Colors.green[600] ,
            width: ladoAnCuadrado,
            height: ladoAlCuadrado,
          ),
          Text("$ladoAnCuadrado x $ladoAlCuadrado"),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  onChanged: (valorActual){
                    ladoAnCuadrado = double.parse(valorActual);
                    ladoAlCuadrado = double.parse(valorActual);

                    setState(() {
                      
                    });
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget circulo(){
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: radioCircular,
            backgroundColor: Colors.black,
          ),
          SelectableText("$radioCircular"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  onChanged: (valorActual){
                    radioCircular = double.parse(valorActual);
                  
                    setState(() {
                      
                    });
                  },
                ),
              )
            ],
          )
       ],
      ),
    );
  }

  Widget rectangulo(){

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(

            duration: const Duration(seconds: 1),
            color:  Colors.green[600] ,
            width: ladoAnRectangulo,
            height: ladoAlRectangulo,
          ),
          Text("$ladoAnRectangulo x $ladoAlRectangulo"),

           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 100,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: 'ancho'
                    ),
                    onChanged: (String valorActual){

                      ladoAnRectangulo = double.parse(valorActual);
                      setState(() {
                        
                      });
                    
                    },
                  ),
                ),
              ),

               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: SizedBox(
                  width: 100,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Alto'
                    ),
                    textAlign: TextAlign.center,
                    onChanged: (valorActual){
                      ladoAlRectangulo = double.parse(valorActual);
                    
                      setState(() {
                        
                      });
                    },
                  ),
              ),
               ),
            ],
          )
        ],
      ),
    ); 
  }
}

