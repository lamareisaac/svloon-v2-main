import 'package:flutter/material.dart';

class ProfileUserPageAccount extends StatelessWidget {
  const ProfileUserPageAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Information du compte", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
          SizedBox(height: 30,),
          TextFormField(
            decoration: InputDecoration(
                      
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20)),
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Nom",
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)),
                    fillColor: Colors.transparent,
                    filled: true),
          ),
          SizedBox(height: 30,),
          TextFormField(
            decoration: InputDecoration(
                      
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20)),
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Prenom",
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)),
                    fillColor: Colors.transparent,
                    filled: true),
          ),
          SizedBox(height: 30,),
          TextFormField(
            decoration: InputDecoration(
                      
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20)),
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Email",
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)),
                    fillColor: Colors.transparent,
                    filled: true),
          ),
          SizedBox(height: 30,),
          TextFormField(
            decoration: InputDecoration(
                      
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20)),
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Téléphone",
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)),
                    fillColor: Colors.transparent,
                    filled: true),
          ),
        ],
      ),
    );
  }
}