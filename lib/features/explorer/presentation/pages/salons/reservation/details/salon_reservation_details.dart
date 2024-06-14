import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SalonReservationDetail extends StatefulWidget {
  const SalonReservationDetail({super.key});

  @override
  State<SalonReservationDetail> createState() => _SalonReservationDetailState();
}

class _SalonReservationDetailState extends State<SalonReservationDetail> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          title: Text(
            'Appointments Details',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey.shade200,
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildSelectedOption("Chez moi", 0),
                        buildSelectedOption("Au salon", 1),
                      ]),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      size: 40,
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
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "CA",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 120,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Date et heure",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            ClipOval(
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://static.vecteezy.com/system/resources/previews/008/442/086/non_2x/illustration-of-human-icon-user-symbol-icon-modern-design-on-blank-background-free-vector.jpg',
                                fit: BoxFit.cover,
                                width: 70,
                                height: 70,
                              ),
                            ),
                            Text(
                              "hello",
                              style: TextStyle(fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 8),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(234, 234, 234, 1),
                            ),
                            child: GestureDetector(
                              child: //show date picker
                                  Center(
                                child: Text(
                                  "Choisir une date",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 8),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.22,
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 8, right: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(234, 234, 234, 1),
                            ),
                            child: Center(
                              child: Text(
                                "heure",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 8),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(234, 234, 234, 1),
                            ),
                            child: const Center(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    weight: 500,
                                  ),
                                  Text(
                                    "Ajouter un nouveau service",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(indent: 20, endIndent: 20,),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sous total",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text("\$250", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Frais de service",
                              style: TextStyle(fontSize: 16)),
                          Text("\$250", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      const Text("Taxe",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("TPS (5%)"),
                          Text("\$12.5"),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("TVQ (9,975%)"),
                          Text("\$24.94"),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text("Moyen de paiement",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/visa.png',
                                scale: 11,
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text("4456", style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Changer',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 18),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }

  Widget buildSelectedOption(String text, int index) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Material(
        color: (selected == index) ? Colors.white : Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
            onTap: () {
              setState(() {
                selected = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                text,
                style: TextStyle(
                  color: (selected == index) ? Colors.black : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
      ),
    );
  }
}
