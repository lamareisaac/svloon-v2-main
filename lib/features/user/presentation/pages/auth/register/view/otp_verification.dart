import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter the 4-digit code sent to you at 05599224612",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
              SizedBox(height: 30),
              OtpTextField(
                margin: EdgeInsets.all(8),
                borderRadius: BorderRadius.circular(8),
                numberOfFields: 4,
                fieldWidth: 60,
                focusedBorderColor: Colors.black,
                borderColor: Colors.black,

                fillColor: Colors.grey.withOpacity(0.1),
                filled: true,

                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode){
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      }
                  );
                }, // end onSubmit
              ),
              GestureDetector(
                  onTap: (){
                   
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(50)),
                          child: Text("I haven’t recieved a code (0.09)", style:TextStyle(fontSize: 16),),
                          
                        ),
                ),
             
            ],
          ),
        


        ],
      ),
    );
  }
}