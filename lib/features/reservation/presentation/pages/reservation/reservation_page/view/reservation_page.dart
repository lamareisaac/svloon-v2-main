import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svloon2/features/reservation/presentation/cubit/reservation_cubit.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  int selected = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
            length: 4,
            child: SafeArea(
                child: Scaffold(
                    appBar: AppBar(
                      toolbarHeight: 100,
                      backgroundColor: Colors.white,
                      automaticallyImplyLeading: false,
                      // leading: IconButton(
                      //   icon: const Icon(
                      //     Icons.arrow_back_ios,
                      //     color: Colors.white,
                      //   ),
                      //   onPressed: () {
                      //     Navigator.of(context).pop();
                      //   },
                      // ),
                      title: Column(
                        children: [
                          Text(
                            "Service rapide ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.black),
                            autofocus: false,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                                suffixText: "dfg",
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20)),
                                contentPadding: EdgeInsets.all(10),
                                labelText: "Que cherchez vous ?",
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20)),
                                fillColor: Colors.transparent,
                                filled: true),
                          ),
                        ],
                      ),
                      bottom: TabBar(
                        indicator: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(20), // Creates border
                            color: Colors.white),
                        unselectedLabelColor: Colors.grey,
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                        ),
                        isScrollable: true,
                        labelColor: Colors.black,
                        tabs: [
                          Tab(
                            child: buildSelectedOption("Tous", 1),
                          ),
                          Tab(
                            child: buildSelectedOption("Babershop", 2),
                          ),
                          Tab(
                              child:
                                  buildSelectedOption("Salon de coiffure", 3)),
                          Tab(child: buildSelectedOption("Tattooshop", 4))
                        ],
                      ),
                      elevation: 0,
                    ),
                    body: Builder(builder: (context) {
                      return TabBarView(children: []);
                    })))));
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
            setState(() {
              selected = index;
            });
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
}
