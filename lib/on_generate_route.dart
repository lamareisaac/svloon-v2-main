
import 'package:flutter/material.dart';

import 'features/user/presentation/pages/auth/register/view/register_page2.dart';
import 'features/global/const/page_const.dart';

class OnGenerateRoute{


  static Route<dynamic> route(RouteSettings settings){

    final args = settings.arguments;


    switch(settings.name){
     
    
      case PageConst.registrationPage :{
        return materialPageBuilder(widget: RegisterPage2());
      }

     
      default:
        return materialPageBuilder(widget: ErrorPage());
    }

  }




}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("error"),
      ),
      body: Center(
        child: Text("error"),
      ),
    );
  }
}



MaterialPageRoute materialPageBuilder({required Widget widget}){
  return MaterialPageRoute(builder: (_) =>widget);
}