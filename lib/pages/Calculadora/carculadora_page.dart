import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class CalculadoraPage extends StatefulWidget {
  CalculadoraPage({Key? key}) : super(key: key);

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {

    final formatter = new NumberFormat("###,###,###", "es-co");
  
  String valorActual = '0';

  double valor1 = 0;

  double valor2 = 0;

  String signo = '';

  void setValorActual({int num1 = 0}){

    if(signo != ''){
      valor2 = double.parse(valorActual);
      print('success');
    }


    if(valorActual.startsWith('0.')){
      valorActual = valorActual.toString() + '$num1'; 
    }else if (valorActual.startsWith('0')){
      valorActual = '$num1'; 
    }else{
      valorActual = valorActual.toString() + '$num1'; 
    }


   
    setState(() {
      
    });
  }

  void setSignoActual({String letra = ''}){
      signo = letra;

      valor1 = double.parse(valorActual);
      valorActual = '0';

      setState(() {
        
      });
  }

  void deleteAll({String letra = ''}){
      signo = '';
      valorActual = '0';
      valor1 = 0;
      valor2 = 0;
      setState(() {
        
      });
  }

  void invertCurrentValue(){

      valorActual = (double.parse(valorActual) * -1).toString();

      setState(() {
        
      });
  }

  void deletelastNumber(){

      if( valorActual.toString().length == 1 ){
        valorActual = '0';
      }else{
        valorActual = (valorActual.toString()).substring(0,valorActual.toString().length - 1 );
      }

      setState(() {
        
      });
  }

    void addPointCurrentValue(){

      if( valorActual.toString().contains('.') ) return; 

      if(valorActual.toString().startsWith('0')){
        valorActual = '0.'; 
      }else{
        valorActual =  valorActual.toString() + '.'; 
      }

      setState(() {
        
      });
    }

    void calResult(){

      valor2 = double.parse(valorActual);


      if(signo == "+"){
        valorActual = (valor1 + valor2).toString();
      }else  if(signo == "-"){
          valorActual = (valor1 - valor2).toString();
      }else  if(signo == "/"){
          valorActual = (valor1 / valor2).toString();
      }else  if(signo == "X"){
          valorActual = (valor1 * valor2).toString();
      }

      
      
      setState(() {
        
      });
      
    }

  Widget botonCalculadora({ String texto ="-" , Color color = const Color.fromRGBO(237, 151, 49,1), Function? onClick,bool big = false }){
   
   
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: (){ 

            if(onClick != null){
              onClick();  
            }

          },
          child: Container(
            width: big==false? 50: 120,
            height: 50,
            child: Center(child: Text(texto,style: const TextStyle(color: Colors.white),)),
            
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(50), 

            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Calculadora",
          style: TextStyle(
              fontWeight: FontWeight.w100,
              color: Colors.white,
              fontFamily: 'SchDancingScriptyler',
              fontSize: 25),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: Center(
        child: Container(
          color: Colors.transparent,
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
               Text('$valor1', style: const TextStyle(color: Colors.white,fontSize: 20)),
               Text ( signo, style: const TextStyle(color: Colors.white,fontSize: 18)),
               Text ('$valor2', style: const TextStyle(color: Colors.white,fontSize: 20)),
               const Divider(color:Colors.white,),
               Text (valorActual  , style: const TextStyle(color: Colors.white, fontSize: 40)), 
               Text ("En peso: \$${formatter.format(int.parse( valorActual.replaceAll('.', '')))}"  , style: const TextStyle(color: Colors.grey, fontSize: 14,)), 
             ],),
           ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    botonCalculadora (color: const Color.fromRGBO(154, 154, 153, 1), texto: 'AC',onClick: ()=>deleteAll()),
                    botonCalculadora (color: const Color.fromRGBO(154, 154, 153, 1), texto: '+/-',onClick: ()=>invertCurrentValue()),
                    botonCalculadora (color: const Color.fromRGBO(154, 154, 153, 1), texto: 'DEL',onClick: ()=>deletelastNumber()),
                    botonCalculadora (color: const Color.fromRGBO(237, 151, 49,1), texto: '/',onClick: ()=>setSignoActual(letra: '/')),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    botonCalculadora (color: const Color.fromRGBO(45, 45, 44, 1), texto: '7',onClick: ()=>setValorActual(num1: 7)),
                    botonCalculadora (color: const Color.fromRGBO(45, 45, 44, 1), texto: '8',onClick: ()=>setValorActual(num1: 8)),
                    botonCalculadora (color: const Color.fromRGBO(45, 45, 44, 1), texto: '9',onClick: ()=>setValorActual(num1: 9)),
                    botonCalculadora (color: const Color.fromRGBO(237, 151, 49,1), texto: 'X',onClick: ()=>setSignoActual(letra: 'X')),
                  ],
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    botonCalculadora (color: const Color.fromRGBO(45, 45, 44, 1), texto: '4',onClick: ()=>setValorActual(num1: 4)),
                    botonCalculadora (color: const Color.fromRGBO(45, 45, 44, 1), texto: '5',onClick: ()=>setValorActual(num1: 5)),
                    botonCalculadora (color: const Color.fromRGBO(45, 45, 44, 1), texto: '6',onClick: ()=>setValorActual(num1: 6)),
                    botonCalculadora (color: const Color.fromRGBO(237, 151, 49,1), texto: '-',onClick: ()=>setSignoActual(letra:'-')),
                  ],
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    botonCalculadora (color: const Color.fromRGBO(45, 45, 44, 1), texto: '1', onClick: ()=>setValorActual(num1: 1)),
                    botonCalculadora (color: const Color.fromRGBO(45, 45, 44, 1), texto: '2', onClick: ()=>setValorActual(num1: 2) ),
                    botonCalculadora (color: const Color.fromRGBO(45, 45, 44, 1), texto: '3', onClick: ()=>setValorActual(num1: 3)),
                    botonCalculadora (color: const Color.fromRGBO(237, 151, 49,1), texto: '+', onClick: ()=>setSignoActual(letra: '+')),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    botonCalculadora (color: const Color.fromRGBO(45, 45, 44, 1), texto: '0', big: true, onClick: ()=>setValorActual(num1: 0)  ),
                    botonCalculadora (color: const Color.fromRGBO(45, 45, 44, 1), texto: '.',onClick: ()=> addPointCurrentValue()),
                    botonCalculadora (color: const Color.fromRGBO(237, 151, 49,1), texto: '=',onClick: ()=> calResult()),
                    
                  ],
                ),
              ),

              

            ],
          ),
        ),
      ),
    );
  }
}
