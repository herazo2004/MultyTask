import 'package:flutter/material.dart';
import 'package:multi_task/main.dart';
import 'package:multi_task/utils/valitaciones.dart';





class FormularioPage extends StatefulWidget {
  FormularioPage({Key? key}) : super(key: key);

  @override
  _FormularioPageState createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  //formulario Tipo 1
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //formulario Tipo 2
  var formKey2 = GlobalKey<FormState>();
  TextEditingController queEstasPensandoController = TextEditingController();
//  TextEditingController passwordController = TextEditingController();


  //formulario Tipo 3
 var formKey3 = GlobalKey<FormState>();

  TextEditingController nameController            = TextEditingController();
  TextEditingController lastNameController        = TextEditingController();
  TextEditingController mailController            = TextEditingController();
  TextEditingController confirmMailController     = TextEditingController();
  TextEditingController password2Controller       = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FocusNode nameFocus = FocusNode();           
  FocusNode lastNameFocus = FocusNode();       
  FocusNode mailFocus = FocusNode();           
  FocusNode confirmMailFocus = FocusNode();    
  FocusNode password2Focus = FocusNode();      
  FocusNode confirmPasswordFocus = FocusNode();

  bool isView = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Formulario',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: [
           Container(
            height: double.maxFinite,
            width: double.maxFinite,
            // color: Colors.black,
            child:  mostrarFormularioTipo3(),
          ),
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: Colors.transparent,
            child: formularioTipo1(),
          ),
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: Colors.amberAccent,
            child: formularioTipo2(),
          ),
         
        ],
      ),
    );
  }

  Widget formularioTipo1() {
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                validator: (value) => Validaciones().validateEmail(value),
                decoration: const InputDecoration(
                    labelText: 'Correo', hintText: 'Example@expample.com'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                validator: (value) => Validaciones().validatePassword(value),
                decoration: const InputDecoration(
                    labelText: 'Contraseña', hintText: '*********'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (!formKey.currentState!.validate()) return;

                    emailController.text = '';
                    passwordController.text = '';

                    showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text('Felicidades'),
                            content: Text(
                                'Excelente! Haz diligenciado los Datos correctamente'),
                          );
                        });
                  },
                  child: const Text('login')),
            ],
          ),
        ));
  }


  Widget formularioTipo2() {
    return Form(

      key: formKey2,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              maxLines: 8,
              decoration:
                  const InputDecoration(labelText: "¿QUE ESTAS PENSANDO?"),
                  controller: queEstasPensandoController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                queEstasPensandoController.text ='';

                showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        title: Text('Felicidades'),
                        content: Text(
                            'wow! que buen pensamiento filosofico tienes'),

                      );
                    });
              },
              child: const Text('ENVIAR'),
            ),
          ],
        ),
      ),
    );
  }


  Widget mostrarFormularioTipo3(){
    return Padding(
      padding: const EdgeInsets.all(35.0),
      child: Form(
          key: formKey3,
          child: Column(
            children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    focusNode: nameFocus,
                    controller: nameController,

                    decoration:  InputDecoration(
                       border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ), 
                        labelText: 'Nombres', hintText: 'Juanito '),
                    onFieldSubmitted: (c){
                      lastNameFocus.requestFocus();
                    },    
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    focusNode: lastNameFocus,
                    controller: lastNameController,

                    decoration:  InputDecoration(
                       border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ), 
                        labelText: 'Apellidos', hintText: 'Perez Alcachofa'),
                    onFieldSubmitted: (c){
                      mailFocus.requestFocus();
                    }, 
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    focusNode: mailFocus,
                    controller: mailController,

                    validator: (value) => Validaciones().validateEmail(value),
                    decoration:  InputDecoration(
                       border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ), 
                        labelText: 'Correo Electronico', hintText: 'tuCorreo@gmail.com'),
                    onFieldSubmitted: (c){
                      confirmMailFocus.requestFocus();
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    focusNode: confirmMailFocus,
                    controller: confirmMailController,

                    validator: (value) => Validaciones().validateRepetEmail(value, mailController.text),
                    decoration:  InputDecoration(
                       border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ), 
                       labelText: 'Confirmar correo', hintText: 'elMismo@gmail.com'),
                    onFieldSubmitted: (c){
                      password2Focus.requestFocus();
                    },
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    focusNode: password2Focus,
                    controller: password2Controller,
                    obscureText: isView,
                    validator: (String? value) =>  Validaciones().validatePassword(value),
                    decoration: InputDecoration(
                       border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ), 
                      suffixIcon: IconButton(
                        icon: isView? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                        onPressed: (){

                          isView = !isView;
                          setState(() {
                            
                          });
                        
                        },
                      ),
                        labelText: 'Contraseña', hintText: '*********'),
                    onFieldSubmitted: (c){
                      confirmPasswordFocus.requestFocus();
                    },
                        
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    focusNode: confirmPasswordFocus,
                    controller: confirmPasswordController,
                    obscureText: isView,
                    validator: (value) => Validaciones().validateRepetPassword(value, password2Controller.text),
                    decoration: InputDecoration( 
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ), 
                       suffixIcon: IconButton(
                        icon: isView? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                        onPressed: (){

                          isView = !isView;
                          setState(() {
                            
                          });
                        
                        },
                      ),
                      labelText: 'Confirmar Contraseña', hintText: '*********'),
                    onFieldSubmitted: (c){
                      enviarDatos();
                    },
                      
                        

                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(onPressed: (){
                    enviarDatos();
                  }, child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text('Enviar datos'),
                  )),
                )

           

            ],
          ),
      ),
    );
  }

  enviarDatos(){
    if (!formKey3.currentState!.validate()) return;

          nameController.text = '';
          lastNameController.text = '';
          mailController.text = '';
          confirmMailController.text = '';
          password2Controller.text = '';
          confirmPasswordController.text = '';

          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  title: Text('Felicidades'),
                  content: Text(
                      'Excelente! Haz diligenciado los Datos correctamente'),
                );
              });
  }
// List<int> [1,2,3,4,5,6,7,8,9]

}
