import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:country_code_picker/country_code_picker.dart';

import '../../../../../../../style.dart';
import 'register_page.dart';

class PhoneRegister extends StatefulWidget {
  final PageController onNext;

  const PhoneRegister({Key? key, required this.onNext}) : super(key: key);

  @override
  State<PhoneRegister> createState() => _PhoneRegisterState();
}

class _PhoneRegisterState extends State<PhoneRegister> {
  final TextEditingController _phoneController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FlutterSecureStorage storage = FlutterSecureStorage();

  bool show = true;
  String? phoneValue;
  String? errorText;
  String countryCode = "225";
  bool validate = false;

  bool circular = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
       
     
        body: SingleChildScrollView(
          child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    
                    TextButton(
                      onPressed:() {
                         Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  RegisterPage()),
                );
                      },
                      child: Text("Créer un compte",
                      style: TextStyle(color: Colors.black, fontSize: 15),),
                      //style: ktitle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Entrez votre nº de téléphone",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  //style: ktitle,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8)),
                      child:  Row(
                        children: [

                          CountryCodePicker(
                            onChanged: (e){
                              setState(() {
                                countryCode = e.dialCode!;
                              });
                            },
                            hideMainText: true,
                            padding: EdgeInsets.all(0),
                            showFlagMain: true,
                            showFlag: true,
                            initialSelection: 'ci',
                            hideSearch: false,
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: true,
                          ),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 240,
                      decoration: BoxDecoration(color: Colors.white),
                      child: TextFormField(
                      
                        autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                        autocorrect: true,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        
                        decoration: InputDecoration(
                          label: Text(countryCode! ?? "", style: TextStyle(color: Colors.black),),
                          
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
                          fillColor: Colors.grey.withOpacity(0.1),
                          focusColor: Colors.black,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.1)),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        controller: _phoneController,
                        
                      ),
                    ),
                  
                  ],
                ),
              ],
            ),
            SizedBox(
                  height: 30,
                ),
                MaterialButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (_phoneController.text.length == 10) {
                      setState(() {
                        circular = true;
                      });
                      await storage.write(key: 'phone', value: phoneValue);

                      setState(() {
                        circular = false;
                      });
                      widget.onNext.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.ease);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("le numéro de téléphone n'est pas valide")));
                    }
                  }
                },
                color: Colors.black,
                minWidth: 300,
                height: 60,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child:   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 20,),
                        Text(
                            'Suivant',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),

                          !circular ? Icon(Icons.arrow_forward, color: Colors.white,) : CircularProgressIndicator.adaptive()
                      ],
                    ),
              ),
              SizedBox(height: 20,),
              Text("By proceeding, you consent to get calls, Whatsapp or SMS messages, including by automated means, from uber and its affiliates to the number provided.", style: TextStyle(color: Colors.grey),),
              SizedBox(height: 20,),
               Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  [
                        Expanded(child: Divider(thickness: 2)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                              side:  const BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("assets/images/google.png", fit: BoxFit.cover, width: 30, height: 30),
                              Container(
                                child: Text(
                                    "Continuer avec Google",
                                    maxLines: 2,
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
          ],
        ),
          ),
        ),
      ),
    );
  }

 
}
