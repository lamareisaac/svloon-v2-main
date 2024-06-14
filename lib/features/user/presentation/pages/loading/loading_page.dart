import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/login/view/login_page.dart';
import '../auth/register/view/register_page.dart';
import '../../cubit/auth/auth_cubit.dart';
import '../../cubit/credential/credential_cubit.dart';
import '../home/home_page.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is UnAuthenticated) {
                  return LoginPage();
                }
                else if (authState is AuthInitial) {
                  return _loading_body();
                }
                else{
                  return HomePage();
                }
              },
            )
      
      
      
      
      
    );
    
  }
  Widget _loading_body(){
    return Container(
        child: Center(
          child: Image.asset("assets/images/loading.png", scale: 10,),
        ),
      );
  }
}