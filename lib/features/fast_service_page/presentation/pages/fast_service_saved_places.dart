import 'package:flutter/material.dart';

class FastServiceSavedPlace extends StatefulWidget {
  const FastServiceSavedPlace({super.key});

  @override
  State<FastServiceSavedPlace> createState() => _FastServiceSavedPlaceState();
}

class _FastServiceSavedPlaceState extends State<FastServiceSavedPlace> {
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
        body: Column(
          children: [
            
          const SizedBox(
                        height: 40,
                      ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                  
                 
                     Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            size: 20,
                            color: Colors.black,
                          ),
                          const SizedBox(
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
                          const SizedBox(
                      width: 120,
                    ),
                          Icon(
                            Icons.edit_outlined,
                            size: 20,
                            color: Colors.black,
                          ),
                        ],
                      ),

                      const SizedBox(
                      height: 40,
                    ),
                     Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            size: 20,
                            color: Colors.black,
                          ),
                          const SizedBox(
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
                          const SizedBox(
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
        ));
  }
}