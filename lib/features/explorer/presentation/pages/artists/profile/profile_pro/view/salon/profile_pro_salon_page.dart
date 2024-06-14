import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:svloon2/features/explorer/data/model/salon_model.dart';


import 'profile_pro_book_page.dart';
import 'profile_salon_potorfolio_page.dart';
import 'profile_pro_staff_page.dart';

class ProfileUProSalonPage extends StatefulWidget {
  Salon salon;
  ProfileUProSalonPage({super.key, required this.salon});

  @override
  State<ProfileUProSalonPage> createState() => _ProfileUProSalonPageState();
}

class _ProfileUProSalonPageState extends State<ProfileUProSalonPage> {
    bool isFavorite = false;

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: widget.salon.pictures.length,
                    itemBuilder: (context, index, i) {
                      var pictures = widget.salon.pictures;
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.35,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(pictures.isEmpty
                                    ? 'https://static.vecteezy.com/system/resources/previews/008/442/086/non_2x/illustration-of-human-icon-user-symbol-icon-modern-design-on-blank-background-free-vector.jpg'
                                    : pictures[index]))),
                      );
                    },
                    options: CarouselOptions(
                      viewportFraction: 1,
                      aspectRatio: 1.3,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                                size: 30,
                              )),
                        ),
                        Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                shape: BoxShape.circle),
                            child: IconButton(
                              onPressed: ()=>setState(() {
                                isFavorite = !isFavorite;
                              }),
                              icon: isFavorite ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ):  Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            )))
                      ],
                    ),
                  )
                ],
              ),
              // SizedBox(
              //   height: 20,
              // ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 30.0, top: 10, bottom: 20),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "${widget.salon.coverPicture ?? "https://static.vecteezy.com/system/resources/previews/008/442/086/non_2x/illustration-of-human-icon-user-symbol-icon-modern-design-on-blank-background-free-vector.jpg"}",
                                      fit: BoxFit.cover,
                                      width: 70,
                                      height: 70,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${widget.salon.name}',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        widget.salon.adresse != null
                                            ? widget.salon
                                                .adresse!.addressName
                                            : 'adressse indisponible',
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
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle),
                                  child: Image.asset(
                                      'assets/images/messenger_u.png')),
                            ])
                ),
              ),
           widget.salon.commodities.length > 0 ? SizedBox(
                      height: 90,
                      child: ListView.builder(
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: widget.salon.commodities.length,
                          itemBuilder: (context, index) {
                            var item = widget.salon.commodities[index];
                            return Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                margin: EdgeInsets.only(left: 5, right: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.5),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 20, 20, 0),
                                      child: Image.network('${item.imageUrl}'),
                                    ),
                                    Text(
                                      "${item.label}",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ));
                          }),
                    ): const Center(
                        child: Text(
                            "Aucune commidité disponible",
                             style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
              DefaultTabController(
                length: 3,
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
                        setState(() {
                          index = int;
                        });
                      },
                      tabs: const [
                        Tab(
                          text: 'Book',
                        ),
                        Tab(
                          text: 'Portofolio',
                        ),
                        Tab(
                          text: 'Staff',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              index == 0
                  ? ProfileProBookPage(salon: widget.salon,)
                  : index == 1
                      ? ProfileProPortofolioPage(porfolio: widget.salon.porfolio,)
                      : ProfileProStaffPage(staff: widget.salon.staff,),
            ],
          )),
    );
  }
}
