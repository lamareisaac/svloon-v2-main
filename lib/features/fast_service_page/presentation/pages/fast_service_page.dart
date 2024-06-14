import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:svloon2/style.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Location/presentation/cubit/location_saved_cubit.dart';
import '../../../global/common/common.dart';
import '../../../widget/toggle_button.dart';
import '../cubit/catalogue/get_catalogue_services_cubit.dart';
import '../cubit/get_service_cubit.dart';
import 'fast_service_details_page.dart';
import 'fast_service_search_page.dart';

class FastservicePage extends StatefulWidget {
  const FastservicePage({super.key});

  @override
  State<FastservicePage> createState() => _FastservicePageState();
}

class _FastservicePageState extends State<FastservicePage> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<GetServiceCubit>(context).getCatalogue();

    super.initState();
  }

  final PanelController panelController = PanelController();

  double radius = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            
            statusBarColor: Colors.red,

            // Status bar brightness (optional)
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
        ),
        body: Center(
          child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                toolbarHeight: 47,
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: true,
                  elevation: 0,
                  title: Center(
                      child: Image.asset(
                    "assets/images/Saloon.png",
                  )))
            ],
            body: Stack(
              children: [
                Positioned(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.31,
                      viewportFraction: 1,
                      aspectRatio: 2,
                      autoPlay: true,
                    ),
                    items: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/images/banner.jpg"),
                            fit: BoxFit.cover,
                          ),
                          color: Style.cameraPageBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 130,
                                margin: EdgeInsets.only(left: 0),
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Stack(children: [
                                  BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 4,
                                      sigmaY: 4,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border:
                                            Border.all(color: Colors.transparent),
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.black.withOpacity(0.15),
                                              Colors.black.withOpacity(0.15),
                                            ])),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Text(
                                          "Hilligo, l’un des meilleurs salons de coiffure à Montréal",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 16),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.4,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: const [
                                                Text("Voir le profil",
                                                    overflow: TextOverflow.fade,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 16),
                                                    softWrap: true),
                                                Icon(Icons.arrow_forward),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/images/banner2.png"),
                            fit: BoxFit.cover,
                          ),
                          color: Style.cameraPageBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 130,
                                margin: EdgeInsets.only(left: 0),
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Stack(children: [
                                  BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 0,
                                      sigmaY: 0,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border:
                                            Border.all(color: Colors.transparent),
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.black.withOpacity(0.15),
                                              Colors.black.withOpacity(0.15),
                                            ])),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Profitez de 15% de réduction sur ce service",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 16),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.4,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: const [
                                                Text("Voir le profil",
                                                    overflow: TextOverflow.fade,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 16),
                                                    softWrap: true),
                                                Icon(Icons.arrow_forward),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SlidingUpPanel(
                  onPanelOpened: () {
                    setState(() {
                      radius = 0;
                    });
                
                  },
                  onPanelClosed: () {
                    setState(() {
                      radius = 20;
                    });
                
                  },
                  color: Colors.white,
                  controller: panelController,
                  borderRadius:
                       BorderRadius.vertical(top: Radius.circular(radius)),
                  minHeight: MediaQuery.of(context).size.height * 0.47,
                  maxHeight: MediaQuery.of(context).size.height,
                  isDraggable: true,
                  parallaxEnabled: true,
                  panelBuilder: (ScrollController sc) {
                    return Container(
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(13, 0, 20, 0),
                            child: Text(
                              "Service Rapide",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 0, right: 10),
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                                                                       Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>FastServiceSearchPage()));

                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 7),
                                            child: Text(
                                              "Chez moi",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/pos.png",
                                                  width: 13,
                                                  height: 13,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  width:
                                                      150, // Limitez la largeur du conteneur pour le débordement de texte
                                                  child: Text(
                                                    "55 Avenue du Mont-Royal O",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.black,
                                                      fontSize: 13,
                                                    ),
                                                    overflow: TextOverflow
                                                        .ellipsis, // Cela ajoute des points de suspension en cas de débordement
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Image.asset(
                                                  "assets/images/dropdown.png",
                                                  width: 9,
                                                  height: 9,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                ToogleButton(index: 1),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: BlocBuilder<GetServiceCubit, GetServiceState>(
                                builder: (context, state) {
                              
                              if (state is GetServiceLoading) {
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey.shade400,
                                  highlightColor: Colors.grey.shade200,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20.0, 10, 20, 10),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height * 0.1,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color.fromRGBO(234, 234, 234, 1),
                                      ),
                                      padding: const EdgeInsets.all(8),
                                    ),
                                  ),
                                );
                              } else if (state is GetServiceSuccess) {
                                if (state.services.isEmpty) {
                                  Center(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8.0, 80, 8, 8),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width *
                                            0.62,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: const Color.fromRGBO(
                                              234, 234, 234, 1),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Aucun salon trouvé",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return ListView.builder(
                                  clipBehavior: Clip.none,
                                  shrinkWrap: true,
                                  itemCount: state.services.length,
                                  itemBuilder: (_, i) {
                                    final item = state.services[i];
                                    return GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<GetCatalogueServicesCubit>(
                                                context)
                                            .getCatalogueServices(item.id);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FastServiceDetailsPage(
                                                    item: item,
                                                  )),
                                        );
                                        
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20.0, 10, 20, 10),
                                        child: Container(
                                            width:
                                                MediaQuery.of(context).size.width,
                                            height: 85.5
                                                ,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color:
                                                  Color.fromRGBO(234, 234, 234, 1),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "${item.imageUrl}"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            padding: const EdgeInsets.all(8),
                                            child: Center(
                                                child: Text("${item.label}",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w900,
                                                        fontSize: 34)))),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                toast(
                                    "Mauvaise conexion internet, réessayez plus tard");
                                return Center(
                                    child: CircularProgressIndicator.adaptive());
                              }
                            }),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
