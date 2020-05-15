import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../classes/auth_firebase.dart';

class LoginPage extends StatefulWidget{
  LoginPage({Key key, this.title, this.auth,this.onSignIn}):super(key:key);
  final String title;
  final AuthFirebase auth;
  final VoidCallback onSignIn;
  LoginPageState createState()=>new LoginPageState();
}

enum FormType{
  login,
  register
}

class LoginPageState extends State<LoginPage>{
  final formkey = GlobalKey<FormState>();
  FormType formType = FormType.login;
  var email = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.green[100],
      body: new SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formkey,
          child: Column(
            children: formLogin(),
          ),
        )
      )
    );
  }

  List<Widget> formLogin(){
    return [
      padded(
        child: TextFormField(
          controller: email,
          decoration: InputDecoration(
              icon: Icon(Icons.person), labelText: 'Correo'
          ),
          autocorrect: false,
        )
      ),
      padded(
          child: TextFormField(
            controller: password,
            decoration: InputDecoration(
                icon: Icon(Icons.lock), labelText: 'Contraseña'
            ),
            autocorrect: false,
            obscureText: true,
          )
      ),
      Column(
        children: buttonWidgets(),
      )
    ];

  }

  List<Widget> buttonWidgets(){
    switch(formType){
      case FormType.login:
        return[styleButton('Iniciar Sesión', validateSubmit),
        FlatButton(
          child: Text("¿No tienes una cuenta? Regístrate"),
          onPressed: ()=>updateFormType(FormType.register),
        ),

        ];
      case FormType.register:
        return[styleButton('Crear Cuenta', validateSubmit),
          FlatButton(
            child: Text("Iniciar Sesión"),
            onPressed: ()=>updateFormType(FormType.login),
          ),];
    }
  }

  void updateFormType(FormType form){
    formkey.currentState.reset();
    setState(() {
      formType = form;
    });
  }

  void validateSubmit(){
    (formType == FormType.login)?
    widget.auth.signIn(email.text, password.text):
    widget.auth.createUser(email.text, password.text);
    widget.onSignIn();
  }

  Widget styleButton(String text, VoidCallback onPressed){
    return new RaisedButton(
        onPressed: onPressed,
        color: Colors.green[300],
        textColor: Colors.white,
        child: Text(text)
    );
  }

  Widget padded({Widget child}){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: child,
    );
  }
}