import 'package:flutter/cupertino.dart';
import 'login_page.dart';
import 'home_page.dart';
import '../classes/auth_firebase.dart';

class RootPage extends StatefulWidget{
  RootPage({Key key,this.authFirebase}):super(key:key);
  final AuthFirebase authFirebase;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RootPageState();
  }

}

enum AuthStatus{
  notSignedIn,
  signedIn
}

class RootPageState extends State<RootPage>{
  AuthStatus authStatus = AuthStatus.notSignedIn;
  @override
  void initState(){
    widget.authFirebase;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    switch(authStatus){
      case AuthStatus.notSignedIn:
      return LoginPage(title:'Login',auth: widget.authFirebase,
        onSignIn: ()=>updateAuthStatus(AuthStatus.signedIn),);
      case AuthStatus.signedIn:
        return HomePage(onSignIn: ()=>updateAuthStatus(AuthStatus.notSignedIn),
          authFirebase:widget.authFirebase ,);
      }
  }

  void updateAuthStatus(AuthStatus auth){
    setState(() {
      authStatus = auth;
    });
  }

}