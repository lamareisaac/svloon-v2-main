import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svloon2/features/explorer/data/model/salon_model.dart';
import 'package:svloon2/features/explorer/presentation/cubit/artistes/select_random_artist/select_artist_cubit.dart';
import 'package:svloon2/features/explorer/presentation/pages/salons/reservation/details/salon_reservation_details.dart';
import 'package:svloon2/features/explorer/presentation/pages/salons/reservation/details/salon_reservation_summary.dart';
import 'package:svloon2/features/fast_service_page/domain/domain/entities/request_profile_service_entity.dart';
import 'package:svloon2/features/fast_service_page/presentation/cubit/request_service/request_salon_service_cubit.dart';
import 'package:svloon2/features/global/common/common.dart';
import 'package:svloon2/features/user/presentation/cubit/auth/auth_cubit.dart';
import 'package:svloon2/features/widget/calendar_popup_view.dart';
import '../../../../../../../size_config.dart';
import '../../../../../../../style.dart';
import 'package:intl/intl.dart';

class ReservationFormSalonPage extends StatefulWidget {
  Salon item;
  int serviceId;
  ReservationFormSalonPage(
      {super.key, required this.item, required this.serviceId});

  @override
  State<ReservationFormSalonPage> createState() =>
      _ReservationFormSalonPageState();
}

class _ReservationFormSalonPageState extends State<ReservationFormSalonPage> {
  String? imgUrl;

  final TextEditingController _noteController = TextEditingController();

  DateTime dateValue = DateTime.now();

  String? _lat;
  String? _lon;
  bool _isChecked = false;
  bool isExpanded = false;
  String? date;

  DateTime startDate = DateTime.now();
  String? rdvHeure;
  String? formattedDate;
  int? userID;
  int artistID = 0;

  bool _isExpanded = false;
  int? _selectedIndex;

  @override
  void initState() {
    // TODO: implement initState
    if (widget.item.pictures.isNotEmpty) {
      imgUrl = widget.item.pictures[0];
    }
    super.initState();
  }

  void showDemoDialog(BuildContext context) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => CalendarPopupView(
        artists: widget.item.staff,
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

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          userID = state.user.id;
        } else {
          toast("erreur d'utilisateur");
        }
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
                    image: NetworkImage(imgUrl ??
                        'https://i0.wp.com/nigoun.fr/wp-content/uploads/2022/04/placeholder.png?ssl=1'),
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
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Icon(
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
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      Text(
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
                  SizedBox(
                    height: 30,
                  ),

                  widget.item.pictures.isNotEmpty
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: CarouselSlider.builder(
                              options: CarouselOptions(
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      imgUrl = widget.item.pictures[index];
                                    });
                                  },
                                  viewportFraction: 0.5,
                                  enlargeCenterPage: true,
                                  aspectRatio: 2.1,
                                  autoPlay: false,
                                  autoPlayCurve: Curves.easeIn,
                                  enableInfiniteScroll: false),
                              itemCount: widget.item.pictures.length,
                              itemBuilder: (context, index, realIndex) {
                                var item = widget.item.pictures[index];

                                return Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: NetworkImage("$item"),
                                          fit: BoxFit.cover)),
                                );
                              }),
                        )
                      : const Text("Ce salon n'a pas d'image"),

                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 0, 10, 10),
                        child: Text(
                          "Extras",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                        for (int i = 0; i < widget.item.services.length; i++)
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.item.services[i].extra[i].name),
                                    Text(
                                        '${widget.item.services[i].extra[i].prix} €')
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                      '+ ${widget.item.services[i].extra[i].extTime}'),
                                  Radio<int>(
                                    activeColor: Colors.black,
                                    value: i,
                                    toggleable: true,
                                    groupValue: _selectedIndex,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _selectedIndex = value;
                                      });
                                    },
                                  ),
                                ],
                              )
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
                  ExpansionPanelList(
                    elevation: 1,
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        _isExpanded = !isExpanded;
                      });
                    },
                    children: [],
                  ),
                  SizedBox(height: 20),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: widget.item.staff.isEmpty
                                        ? 'https://static.vecteezy.com/system/resources/previews/008/442/086/non_2x/illustration-of-human-icon-user-symbol-icon-modern-design-on-blank-background-free-vector.jpg'
                                        : widget.item.staff[artistID].imageUrl,
                                    fit: BoxFit.cover,
                                    width: 70,
                                    height: 70,
                                  ),
                                ),
                                Text(
                                  widget.item.staff.isEmpty
                                      ? ''
                                      : widget.item.staff[0].fullname,
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            BlocListener<SelectArtistCubit, SelectArtistState>(
                              listener: (context, state) {
                                if (state is RandomArtistSelected) {
                                  artistID = state.artistSelected;
                                } else if (state is ArtistSelected) {
                                  artistID = state.artistId;
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8.0, 8, 8, 8),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                        const Color.fromRGBO(234, 234, 234, 1),
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
                          decoration: const InputDecoration(
                              alignLabelWithHint: true,
                              labelText: "Laissez une note au salon",
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(style: BorderStyle.none),
                              ),
                              contentPadding: EdgeInsets.all(20),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(style: BorderStyle.none),
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
            onTap: () {
              if (date == null) {
                toast("Veuillez sélectionner une date");
                return;
              }
              showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  useSafeArea: false,
                  builder: (context) => SingleChildScrollView(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SalonReservationDetail()),
                                        ),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                width: MediaQuery.of(context).size.width * 0.6,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Center(
                                    child: Text(
                                  'Détais du rendez vous',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.9,
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 30),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30)),
                                ),
                                child: ListView(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Sous total",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text("\$250",
                                            style: TextStyle(fontSize: 16)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Frais de service",
                                            style: TextStyle(fontSize: 16)),
                                        Text("\$250",
                                            style: TextStyle(fontSize: 16)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    const Text("Taxe",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("TPS (5%)"),
                                        Text("\$12.5"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                            Text("4456",
                                                style: TextStyle(fontSize: 20)),
                                          ],
                                        ),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Changer',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 18),
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        BlocProvider.of<
                                                    RequestSalonServiceCubit>(
                                                context)
                                            .requestService(
                                                data:
                                                    RequestProfileServiceEntity(
                                                        serviceId:
                                                            widget.serviceId,
                                                        salonId: widget.item.id,
                                                        userId: userID!,
                                                        isReport: false,
                                                        salonServiceId:
                                                            widget.serviceId,
                                                        instructions:
                                                            _noteController
                                                                .text,
                                                        isCancel: false,
                                                        artistId: artistID,
                                                        dateTime: "",
                                                        details: _noteController
                                                            .text,
                                                        isConfirmed: true,
                                                        reportDate: "",
                                                        hour: rdvHeure!,
                                                        date: formattedDate!));
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SalonReservationSummaryPage()),
                                        );
                                      },
                                      child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.07,
                                          width: 300,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.black),
                                          child: Center(
                                              child: Text(
                                            "Payer",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700),
                                          ))),
                                    ),
                                  ],
                                )
                                ),
                          ],
                        ),
                      ));
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                  child: const Center(
                      child: Text(
                    "Reserver \$250",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ))),
            ),
          ),
        );
      },
    );
  }

  Future<void> showDetailsReservation() async {
    showBottomSheet(
        context: context,
        builder: (context) => Container(
              child: Text('text'),
            ));
  }
}

class Item {
  String headerValue;
  String expandedValue;
  bool isExpanded;

  Item(
      {required this.headerValue,
      required this.expandedValue,
      this.isExpanded = false});
}
