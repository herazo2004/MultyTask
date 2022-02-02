import 'package:flutter/material.dart';

class TemporizadorPage extends StatefulWidget {
  TemporizadorPage({Key? key}) : super(key: key);

  @override
  State<TemporizadorPage> createState() => _TemporizadorPageState();
}

class _TemporizadorPageState extends State<TemporizadorPage> {

  int seg =0;
  bool esLaPrimeravez = true;
  double aceleracion = 0;
 
  @override
  Widget build(BuildContext context) {

    if(esLaPrimeravez == true){

      final args = ModalRoute.of(context)!.settings.arguments;
      seg = int.parse(args.toString());
      esLaPrimeravez = false;
      descontarSegundos();

    }

     

    return Scaffold(
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$seg'+'s', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
            Slider(
              min: 0,
              max: 5,
              value: aceleracion,
             
             onChanged: (v){
              aceleracion = v;

            })
          ],
        ),
      ),
      appBar: AppBar(
     centerTitle: true,
     title: const Text("Temporizador"),
    ),);
    
  }

  descontarSegundos() async {
    
    if(seg == 0){
      return;
    }

    await Future.delayed( const Duration(seconds:1 ));
    seg--;
    setState(() {
      
    });
    descontarSegundos();

  }
}