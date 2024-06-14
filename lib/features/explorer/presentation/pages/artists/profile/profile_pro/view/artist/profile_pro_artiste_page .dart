import 'dart:developer';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:svloon2/features/explorer/data/model/artist_favoris_model.dart';
import 'package:svloon2/features/explorer/data/model/artists_model.dart';
import 'package:svloon2/features/explorer/presentation/pages/artists/profile/profile_pro/view/artist/profile_book_artist_page.dart';
import '../../../../../../cubit/get_single_salon_cubit.dart';

import '../salon/profile_pro_book_page.dart';
import '../salon/profile_salon_potorfolio_page.dart';
import 'profile_artist_potorfolio_page.dart';

class ProfileUProArtistePage extends StatefulWidget {
  Artistes artist;
   ProfileUProArtistePage({super.key, required this.artist});

  @override
  State<ProfileUProArtistePage> createState() => _ProfileUProArtistePageState();
}

class _ProfileUProArtistePageState extends State<ProfileUProArtistePage> {
  int index = 0;
  // late TabController _tabController;
  // int _selectedIndex = 0;
  // @override
  // void initState() {
  //   super.initState();
  //   _tabController = TabController(length: 3, vsync: this);
  //   _tabController.addListener(_handleTabSelection);
  // }

  // @override
  // void dispose() {
  //   _tabController.removeListener(_handleTabSelection);
  //   _tabController.dispose();
  //   super.dispose();
  // }

  // void _handleTabSelection() {
  //   setState(() {
  //     _selectedIndex = _tabController.index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
             Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.35,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "${widget.artist.artist.images.isNotEmpty ? widget.artist.artist.images[0].path : 'https://static.vecteezy.com/system/resources/previews/008/442/086/non_2x/illustration-of-human-icon-user-symbol-icon-modern-design-on-blank-background-free-vector.jpg'}"))),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 30,
                            child: GestureDetector(
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
                          ),
                          Positioned(
                            bottom: 0,
                            left: 30,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 25, left: 50),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 30, top: 5),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 4),
                                        Text(
                                          '${widget.artist.firstname} ${widget.artist.lastname}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          "no addresses",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        Text(
                                          widget.artist.profession ?? "no profession",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 70,
                            bottom: 25,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl:
                                    widget.artist.photoUrl,
                                fit: BoxFit.cover,
                                width: 70,
                                height: 70,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                            child:
                                Image.asset('assets/images/messenger_u.png')),
                        Text("Messages"),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () => showModalBottomSheet(
                            isDismissible: false,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => buildSalonArtistSheet(),
                          ),
                          child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.black, shape: BoxShape.circle),
                              child: Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.white,
                                size: 30,
                              )),
                        ),
                        Text("Voir"),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 30,
                            )),
                        Text("Favoris"),
                      ],
                    ),
                  ]),
             Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 8),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.62,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromRGBO(234, 234, 234, 1),
                        ),
                        child: const Center(
                          child: Text(
                            "Aucune commidité disponible",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  //    SizedBox(
                  //   height: 90,
                  //   child: ListView.builder(
                  //     clipBehavior: Clip.none,
                  //     scrollDirection: Axis.horizontal,
                  //     shrinkWrap: true,
                  //     itemCount: 2,
                  //     itemBuilder: (context, index) {
                  //       var item = widget.artist.artist.[index];
                  //       return Container(
                  //           width: MediaQuery.of(context).size.width * 0.2,
                  //           margin: EdgeInsets.only(left: 5, right: 5),
                  //           decoration: BoxDecoration(
                  //               border: Border.all(
                  //                   color: Colors.grey.withOpacity(0.5),
                  //                   width: 1),
                  //               borderRadius: BorderRadius.circular(20)),
                  //           child: Column(
                  //             children: [
                  //               Padding(
                  //                 padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  //                 child: Image.network('${item.imageUrl}'),
                  //               ),
                  //               Text("${item.label}", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),)
                  //             ],
                  //           ));
                  //     }

                  //   ),
                  // ),
              DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                      padding: const EdgeInsets.all(3),
                      // isScrollable: true,
                      indicatorColor: Colors.black,
                      indicatorWeight: 5.0,
                      labelColor: Colors.black,
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                        fontFamily: 'Poppins',
                      ),
                      onTap: (int) {
                        inspect(int);
                        setState(() {
                          index = int;
                        });
                      },
                      tabs: [
                        const Tab(
                          text: 'Book',
                        ),
                        const Tab(
                          text: 'Portofolio',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
             // index == 0 ? ProfileArtistBookPage() : ProfileProArtistPortefolio(artist: widget.artist.artist),
            ],
          )),
    );
  }

  Widget buildSalonArtistSheet() => DraggableScrollableSheet(
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
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://img.freepik.com/photos-gratuite/portrait-jeune-artiste-souriant-fauteuil-roulant-tenant-croquis-dessin-au-crayon-graphique-toile-travaillant-au-chef-oeuvre-artistique-dans-studio-art-illustrateur-peinture-handicap-notion-creativite_482257-30108.jpg?w=2000&t=st=1695849649~exp=1695850249~hmac=da9e5b148b9ebb17246c38ec1c682b8781332760e887d24ef5d60cc9f28cf458",
                            fit: BoxFit.cover,
                            width: 110,
                            height: 110,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Text(
                              'dd',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              "Adresse indisponible",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 15),
                            ),
                            Text(
                              'Travail de 8h à 19h',
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.black, shape: BoxShape.circle),
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 30,
                        )),
                  ]),
              SizedBox(
                height: 20,
              ),
           
            ],
          ),
        ),
      );
}
