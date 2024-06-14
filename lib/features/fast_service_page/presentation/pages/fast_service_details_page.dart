import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svloon2/features/fast_service_page/presentation/pages/reservation_service_pages/reservation_form_service_page.dart';

import '../../../reservation/presentation/pages/reservation/reservation_form/view/reservation_form_page.dart';
import '../../data/model/fast_service_model.dart';
import '../cubit/get_service_cubit.dart';

class FastServiceDetailsPage extends StatefulWidget {
  final Catalogue item;
  const FastServiceDetailsPage({super.key, required this.item});

  @override
  State<FastServiceDetailsPage> createState() => _FastServiceDetailsPageState();
}

class _FastServiceDetailsPageState extends State<FastServiceDetailsPage> {
  int selected = 0;
  List<Service> filteredServices = [];
  Timer? _debounce;


  @override
  void initState() {
    // TODO: implement initState
    filteredServices = widget.item.services;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                const Text(
                  "Service rapide ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 22),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                onChanged: (value) {
                  if (_debounce?.isActive ?? false) _debounce!.cancel();
                  _debounce = Timer(const Duration(milliseconds: 500), () {
                    if (value.isNotEmpty) {
                      setState(() {
                        filteredServices = widget.item.services
                            .where((service) => service.title
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                            .toList();
                      });
                    } else {
                      setState(() {
                        filteredServices = widget.item.services;
                      });
                    }
                  });
                },
                autofocus: false,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20)),
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Que cherchez vous ?",
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20)),
                    fillColor: Colors.transparent,
                    filled: true),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(

                children: [
                  buildSelectedOption("Tout", 0),
                  const SizedBox(
                    width: 10,
                  ),
                  BlocBuilder<GetServiceCubit, GetServiceState>(
                    builder: (context, state) {
                      if (state is GetServiceSuccess) {
                        return Row(
                          children: [
                            for (int i = 0; i < state.services.length; i++)
                              buildSelectedOption(state.services[i].label, state.services[i].id),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                    },
                  ),
                ],
              )),
          SizedBox(
            height: 20,
          ),
           filteredServices.isNotEmpty ?
                  buildServicesCards(filteredServices)
                  : Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 10, 8, 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(234, 234, 234, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Text(
                          "Ce catalogue est vide",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
        ],
      ),
    ));
  }

  Widget buildSelectedOption(String text, int index) {
    return Material(
      color: (selected == index) ? Colors.black : Colors.transparent,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
          onTap: () {
            filteredServices = widget.item.services;
            setState(() {
              selected = index;
            });
            if (index !=0 ) {
              filteredServices = widget.item.services
                  .where((item) => item.id == selected)
                  .toList();
            }
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: (selected == index) ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )),
    );
  }
  Widget buildServicesCards(List<Service> services) {

    return ListView.builder(
        shrinkWrap: true,
        itemCount:services.length,
        itemBuilder: (context, index) {
          var service =services[index];
          return Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 10, 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ReservationFormServicePage(
                            service: service,
                          )),
                );
              },
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.16,
                  child: Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                  Colors.grey.withOpacity(0.5)),
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                          padding:
                          const EdgeInsets.fromLTRB(8, 8, 8, 0),
                          width:
                          MediaQuery.of(context).size.width * 0.6,
                          child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        constraints:
                                        const BoxConstraints(
                                            maxWidth: 800 < 321
                                                ? 150
                                                : 185,
                                            maxHeight: 30),
                                        child: Text(
                                          '${service.title}',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight:
                                            FontWeight.w900,
                                            fontSize: 20,
                                          ),
                                        )),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        constraints:
                                        const BoxConstraints(
                                            maxWidth: 800 < 321
                                                ? 150
                                                : 185,
                                            maxHeight: 30),
                                        child: Text(
                                          '${service.description}',
                                          style: TextStyle(
                                            shadows: [
                                              Shadow(
                                                blurRadius:
                                                200.0, // shadow blur
                                                color: Colors
                                                    .black, // shadow color
                                                offset: Offset(1.0,
                                                    1.0), // how much shadow will be shown
                                              ),
                                            ],
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    constraints: const BoxConstraints(
                                        maxWidth:
                                        800 < 321 ? 150 : 185,
                                        maxHeight: 30),
                                    child: Text(
                                      '\$${service.price}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Color.fromRGBO(
                                            119, 103, 89, 1),
                                        fontSize: 14,
                                      ),
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                              ])),
                      Container(
                        width:
                        MediaQuery.of(context).size.width * 0.31,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    '${service.imageUrl}'),
                                fit: BoxFit.cover),
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                      )
                    ],
                  )),
            ),
          );
        });
  }
}
