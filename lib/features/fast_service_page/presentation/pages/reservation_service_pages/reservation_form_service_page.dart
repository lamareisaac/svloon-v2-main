import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:svloon2/features/fast_service_page/data/model/fast_service_model.dart';
import 'package:svloon2/features/fast_service_page/domain/domain/entities/request_profile_service_entity.dart';
import 'package:svloon2/features/widget/calendar_popup_view.dart';
import 'package:intl/intl.dart';

import '../../../../../../../size_config.dart';
import '../../../../../../../style.dart';


class ReservationFormServicePage extends StatefulWidget {
  Service service;
  ReservationFormServicePage({super.key, required this.service});

  @override
  State<ReservationFormServicePage> createState() => _ReservationFormServicePageState();
}

class _ReservationFormServicePageState extends State<ReservationFormServicePage> {
  final TextEditingController _noteController = TextEditingController();

  DateTime dateValue = DateTime.now();
  bool isExpanded = false;
  String? imgUrl;

  String? date;

  DateTime startDate = DateTime.now();
  String? rdvHeure;
  String? formattedDate;

  int? _selectedIndex;

  void showDemoDialog(BuildContext context) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => CalendarPopupView(
        barrierDismissible: true,
        currentDate: DateTime.now(),
        //  maximumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 10),

        initialStartDate: startDate,
        onApplyClick: (DateTime startData, String heure) {
          setState(() {
            startDate = startData;
            rdvHeure = heure;
            date = DateFormat.MMMMEEEEd('fr').format(startData);
            formattedDate = DateFormat("MM/dd/yyyy").format(startData);
          });
        },
        onCancelClick: () {},
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(widget.service.imageUrl ?? 'https://i0.wp.com/nigoun.fr/wp-content/uploads/2022/04/placeholder.png?ssl=1'),
                fit: BoxFit.cover,
              ),
              color: Style.cameraPageBackground,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 30,
                            )),
                      ),
                      Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              shape: BoxShape.circle),
                          child: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  const Text(
                    "Very cultural place and people here are really nice. Being veg it’s hard to find a place here easily but the.... Read more",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 0, 10, 10),
                    child: Text(
                      "Extras",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(10.0, 8, 20, 8),
                  //   child: Container(
                  //     width: MediaQuery.of(context).size.width * 0.34,
                  //     padding: const EdgeInsets.all(8),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(20),
                  //       color: const Color.fromRGBO(234, 234, 234, 1),
                  //     ),
                  //     child: const Center(
                  //       child: Text(
                  //         "Obligatoire",
                  //         style: TextStyle(
                  //             fontSize: 20, fontWeight: FontWeight.bold),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),

              Padding(
                  padding: const EdgeInsets.fromLTRB(22.0, 8, 22, 8),
                  child: Column(children: [
                    for (int i = 0; i < widget.service.extras.length; i++)
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${widget.service.extras[i].name}  ${widget.service.extras[i].prix} €'),
                              ],
                            ),
                          ),
                          Radio<int>(
                            activeColor: Colors.black,
                            value: i,
                            groupValue: _selectedIndex,
                            toggleable: true,
                            onChanged: (int? value) {
                              setState(() {
                                _selectedIndex = value;
                              });
                            },
                          ),
                        ],
                      )
                  ])),
              // ExpansionPanelList(
              //     expansionCallback: (int index, bool isExpanded) {
              //       setState(() {
              //         _data[index].isExpanded = !isExpanded;
              //       });
              //     },
              //     children: [
              //       ExpansionPanel(
              //         headerBuilder: (BuildContext context, bool isExpanded) {
              //           return ListTile(
              //             title: Text('option'),
              //           );
              //         },
              //         body: Container(
              //           child: CheckboxListTile(
              //             title: Text('bppp'),
              //             value: _isChecked,
              //             onChanged: (bool? value) {
              //               setState(() {
              //                 _isChecked = value!;
              //               });
              //             },
              //           ),
              //         ),
              //         isExpanded: _data[0].isExpanded,
              //       )
              //     ]),
              // ExpansionPanelList(
              //   elevation: 1,
              //   expansionCallback: (int index, bool isExpanded) {
              //     setState(() {
              //       _isExpanded = !isExpanded;
              //     });
              //   },
              //   children: [],
              // ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Date et heure*",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 8),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(234, 234, 234, 1),
                            ),
                            child: const Center(
                              child: Text(
                                "Obligatoire",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      
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
                                onTap: () => showDemoDialog(context),
                                child: //show date picker
                                    Center(
                                  child: Text(
                                    date ?? "Choisir une date",
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
                                rdvHeure ?? "heure",
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

              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _noteController,
                      minLines: 10,
                      autofocus: false,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                          alignLabelWithHint: true,
                          labelText: "Laissez une note au salon",
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(20)),
                          contentPadding: EdgeInsets.all(20),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(style: BorderStyle.none),
                          ),
                          fillColor: Color.fromRGBO(234, 234, 234, 1),
                          filled: true),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Le salon fera de son mieux pour suivre vos instructions, il pourrait vous contacter pour plus de clarification.",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ))),
      bottomNavigationBar: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.black),
              child: Center(
                  child: Text(
                "Reserver \$250",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ))),
        ),
      ),
    );
  }

  Widget _buildCarouselItem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          width: getProportionateScreenWidth(140),
          child: GestureDetector(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: AssetImage("assets/images/fade.jpg"),
                            fit: BoxFit.cover)),
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

Widget buildPaymentSheet({required RequestProfileServiceEntity request}) =>
    DraggableScrollableSheet(
      initialChildSize: 0.57,
      minChildSize: 0.4,
      maxChildSize: 0.57,
      builder: (context, scrollController) => Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
        ),
        child: ListView(
          controller: scrollController,
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
                Text("Frais de service", style: TextStyle(fontSize: 16)),
                Text("\$250", style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text("Taxe",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            Row(
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                  child: Center(
                      child: Text(
                    "Reserver \$250",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ))),
            ),
          ],
        ),
      ),
    );
