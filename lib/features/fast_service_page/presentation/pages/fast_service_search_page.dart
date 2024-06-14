import 'package:flutter/material.dart';

import 'fast_service_saved_places.dart';

class FastServiceSearchPage extends StatelessWidget {
  const FastServiceSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          title: const Text(
            "Adresse",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 30,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(50)),
                      labelText: "Entrer une nouvelle addresse",
                      labelStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.all(10),
                      border: InputBorder.none,
                      focusColor: Colors.black,
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                  child: GestureDetector(
                    onTap: ()=>Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FastServiceSavedPlace()),
                ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Emplacements enregistrés",
                              style: TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "A proximité",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.navigation,
                              size: 20,
                              color: Colors.black,
                            ),
                            SizedBox(
                          width: 20,
                        ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Emplacement actuel",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                
                                Text(
                                  "2466 Rue sainte catherine",
                                  style: TextStyle(
                                       color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Divider(thickness: 1),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Emplacement récent",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                       Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              size: 20,
                              color: Colors.black,
                            ),
                            SizedBox(
                          width: 20,
                        ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "San Francisco Bay Area",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                
                                Text(
                                  "CA",
                                  style: TextStyle(
                                       color: Colors.grey),
                                ),
        
                              ],
                            ),
                            SizedBox(
                        width: 120,
                      ),
                            Icon(
                              Icons.edit_outlined,
                              size: 20,
                              color: Colors.black,
                            ),
                          ],
                        ),
        
                        SizedBox(
                        height: 40,
                      ),
                       Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              size: 20,
                              color: Colors.black,
                            ),
                            SizedBox(
                          width: 20,
                        ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "San Francisco Bay Area",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                
                                Text(
                                  "CA",
                                  style: TextStyle(
                                       color: Colors.grey),
                                ),
        
                              ],
                            ),
                            SizedBox(
                        width: 120,
                      ),
                            Icon(
                              Icons.edit_outlined,
                              size: 20,
                              color: Colors.black,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
