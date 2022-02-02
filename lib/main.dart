import 'package:flutter/material.dart';
import 'package:multi_task/pages/Animacion/animacion_page.dart';
import 'package:multi_task/pages/Calculadora/carculadora_page.dart';
import 'package:multi_task/pages/Datos/datos_page.dart';
import 'package:multi_task/pages/Formulario/formulario_page.dart';
import 'package:multi_task/pages/Temporizador_page.dart/temporizador.dart';
import 'package:multi_task/pages/home_page.dart';


void main() => runApp(const MyApp());
const title = 'Material App';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: const HomePage(),
      routes: {
        "Calculadora": (context) => CalculadoraPage(),
        "Formulario":(context)=> FormularioPage(),
        "Animacion":(context) => const AnimacionPage(),
        "Temporizador": (context)=> TemporizadorPage(),
        "Datos": (context) => DatosPage()
      },
    );
  }
}
