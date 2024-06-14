import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:svloon2/features/fast_service_page/data/model/request_salon_service_details_model.dart';
import 'package:svloon2/features/fast_service_page/presentation/cubit/request_service/request_salon_service_cubit.dart';
import 'package:svloon2/features/global/common/common.dart';

class SalonReservationSummaryPage extends StatefulWidget {
  SalonReservationSummaryPage({super.key});

  @override
  State<SalonReservationSummaryPage> createState() => _ReservationSummaryPageState();
}

class _ReservationSummaryPageState extends State<SalonReservationSummaryPage> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: const Text(
            'Réservation N°',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                fontSize: 18),
            textAlign: TextAlign.right,
          ),
        ),
      ),
      body:
          BlocBuilder<RequestSalonServiceCubit, RequestSalonServiceCubitState>(
        builder: (context, state) {
          if (state is RequestCubitSuccess) {
            String formattedDateTime =
                DateFormat('EEEE d MMMM à HH:mm', 'fr_FR')
                    .format(state.data.appointement.date);
            return SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.5), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(state.data.appointement.appointmentStatus.name,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w500)),
                            Spacer(),
                            ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: state
                                    .data.appointement.appointmentStatus.image,
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(formattedDateTime,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 20, 0, 0),
                          child: Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.1),
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.call,
                                    color: Colors.black,
                                    size: 30,
                                  )),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.grey.withOpacity(0.1),
                                ),
                                child: Text('Envoyer un message',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Commidités',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    expanded = !expanded;
                                  });
                                },
                                icon: Icon(expanded
                                    ? Icons.arrow_upward
                                    : Icons.arrow_downward))
                          ],
                        ),
                        Visibility(
                            visible: expanded,
                            child: SizedBox(
                              height: 70,
                              child: ListView.builder(
                                  clipBehavior: Clip.none,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: 1,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        margin:
                                            EdgeInsets.only(left: 5, right: 5),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 20, 20, 0),
                                              child: Image.network(
                                                  'https://media.istockphoto.com/id/1138089587/fr/vectoriel/icône-internet-wi-fi-vecteur-wi-fi-wlan-accès-sans-fil-wifi-hotspot-signal-signe.jpg?s=612x612&w=0&k=20&c=Ttk0xaQye_8hHgB7jtAHr3hnfoNq1yyIxKJbnSNqJEo='),
                                            ),
                                            Text(
                                              "Wifi",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ));
                                  }),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Règles de sécurité',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    expanded = !expanded;
                                  });
                                },
                                icon: Icon(expanded
                                    ? Icons.arrow_upward
                                    : Icons.arrow_downward))
                          ],
                        ),
                        Visibility(
                            visible: expanded,
                            child: SizedBox(
                              height: 70,
                              child: ListView.builder(
                                  clipBehavior: Clip.none,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: 1,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        margin:
                                            EdgeInsets.only(left: 5, right: 5),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 20, 20, 0),
                                              child: Image.network(
                                                  'https://media.istockphoto.com/id/1138089587/fr/vectoriel/icône-internet-wi-fi-vecteur-wi-fi-wlan-accès-sans-fil-wifi-hotspot-signal-signe.jpg?s=612x612&w=0&k=20&c=Ttk0xaQye_8hHgB7jtAHr3hnfoNq1yyIxKJbnSNqJEo='),
                                            ),
                                            Text(
                                              "Wifi",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ));
                                  }),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'DETAIL DE LA RESERVATION',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Sous service',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w300)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Option obligatoire',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w300)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('autre option ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w300)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Instruction',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          state.data.appointement.order.instructions ?? "",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text('Total',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            Spacer(),
                            Text('\$' '${state.data.order.totalPrice}',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 50,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Colors.grey.withOpacity(0.5))),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Icon(Icons.receipt),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Afficher le reçu",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ]),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Colors.grey.withOpacity(0.5))),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Icon(Icons.warning),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Signaler un problème",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ]),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ));
          } else if (state is RequestCubitError) {
            toast(state.error);
            return const Center(child: CircularProgressIndicator.adaptive());
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
