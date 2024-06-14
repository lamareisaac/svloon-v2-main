
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svloon2/features/user/presentation/pages/auth/register/view/register_page.dart';


import '../../../../../../global/common/common.dart';
import '../../../../cubit/auth/auth_cubit.dart';
import '../../../../cubit/credential/credential_cubit.dart';
import '../../../home/home_page.dart';
import '../../register/view/register_page2.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPassword = true;
  String countryCode = "225";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  _submitSignIn();
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: 110,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Suivant",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: BlocConsumer<CredentialCubit, CredentialState>(
          listener: (context, state) {
            if (state is CredentialSuccess) {
              BlocProvider.of<AuthCubit>(context).loggedIn();
            }if(state is CredentialFailure){
              toast(state.error);

            }
          },
          builder: (context, state) {
          
           if(state is CredentialLoading){
              return Center(child: CircularProgressIndicator.adaptive());
            }
           if(state is CredentialSuccess){
              return BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is Authenticated) {
                    return HomePage();
                  }
                  
                  else{
                    return _sigInbody();
                  }
                },
              );
            }
            return _sigInbody();
          },
        )
        
        
        
       
        );
        
  }
  

  Widget _sigInbody(){
    return  
        
        
        
        
        Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                           Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  RegisterPage()),
                  );
                          },
                          child: Text(
                            "Créer un compte",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          //style: ktitle,
                        ),
                      ],
                    ),
                    Text(
                      "Bienvenue,",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                      //style: ktitle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                      
                   
            
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty)
                              return "Le champs email ne doit pas être vide !";
        
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Entrez votre email",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(8)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            labelStyle: const TextStyle(color: Colors.grey),
                            contentPadding: const EdgeInsets.all(10),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.2),
                            focusColor: Colors.black,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          controller: _emailController,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          enableSuggestions: isPassword ? false : true,
                          autocorrect: isPassword ? false : true,
                          obscureText: isPassword,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                                    if (value!.isEmpty)
                                      return "Le mot de passe ne dois pas être vide";
                                    if (value.length <= 4)
                                      return "Votre mot de passe dois contenir au moins 4 caractères!";
        
                                    return null;
                                  },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Entrez votre mot de passe",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPassword = !isPassword;
                                  });
                                },
                                icon: Icon(
                                  isPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.black,
                                )),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.2)),
                                borderRadius: BorderRadius.circular(8)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            labelStyle: const TextStyle(color: Colors.grey),
                            contentPadding: const EdgeInsets.all(10),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.2),
                            focusColor: Colors.black,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          controller: _passwordController,
                        ),
                    const SizedBox(
                      height: 30,
                    ),
                 
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(child: Divider(thickness: 2)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text("Ou"),
                          ),
                          Expanded(child: Divider(thickness: 2)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: MaterialButton(
                        elevation: 0,
                        color: Colors.white,
                        height: 60,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/images/google.png",
                                fit: BoxFit.cover, width: 30, height: 30),
                            Container(
                              child: const Text("Continuer avec Google",
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                  ]
            )
          )),
        );
  }
  void _submitSignIn(){
    if (_formKey.currentState!.validate()) {
    BlocProvider.of<CredentialCubit>(context).signInSubmit(
      email: _emailController.text,
      password: _passwordController.text,
    );
    }
  }
}

