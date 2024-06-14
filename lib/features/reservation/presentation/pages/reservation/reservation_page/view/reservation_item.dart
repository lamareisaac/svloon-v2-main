import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../../../../explorer/presentation/pages/artists/profile/profile_pro/view/artist/profile_pro_artiste_page .dart';
import '../../../../../../explorer/presentation/pages/artists/profile/profile_pro/view/salon/profile_pro_salon_page.dart';
import '../../reservation_summary/view/reservation_summary_page.dart';
import 'reservation_list_of_pro.dart';

class ReservationItem extends StatefulWidget {
  const ReservationItem({super.key});

  @override
  State<ReservationItem> createState() => _ReservationItemState();
}

class _ReservationItemState extends State<ReservationItem> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              
              const SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  'Salon',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                trailing: TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        (context),
                        MaterialPageRoute(
                            builder: (context) => ReservationListofPro()),
                        (route) => true);
                  },
                  child: Text('voir plus'),
                ),
              ),
              SizedBox(
                height: 270,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: false,
                    aspectRatio: 1.4,
                    enlargeFactor: 0.25,
                    enlargeCenterPage: true,
                  ),
                  items: [_buildCarouselItem(context, false)],
                ),
              ),

              //  ListView.builder(
              //   scrollDirection: Axis.horizontal,
              //   itemCount: 4,
              //   itemBuilder: (context, index) {
              //     return _buildCarouselItem(context, false);
              //   },
              // ),

              ListTile(
                title: Text(
                  'Artistes',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                trailing: TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        (context),
                        MaterialPageRoute(
                            builder: (context) => ReservationListofPro()),
                        (route) => true);
                  },
                  child: Text('voir plus'),
                ),
              ),
              SizedBox(
                height: 190,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return _buildCarouselItem(context, true);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselItem(BuildContext context, bool isArtiste) {
    //  final _byteImage = const Base64Decoder().convert(offer.image);
    return Padding(
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: () {
            // Navigator.pushAndRemoveUntil(
            //     (context),
            //     MaterialPageRoute(
            //       builder: (context) => isArtiste
            //           ? ProfileUProArtistePage()
            //           : ProfileUProSalonPage(),
            //     ),
            //     (route) => true);
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.33,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height * 0.33,
                  width: isArtiste
                      ? MediaQuery.of(context).size.width * 0.6
                      : MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                          'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/315.jpg',
                      placeholder: (context, url) => Container(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 1,
                  left: -6,
                  right: -6,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(82, 52, 52, 52),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 5),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/315.jpg",
                                  fit: BoxFit.cover,
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                              // SizedBox(
                              //   width: 20,
                              // ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 4),
                                    Text(
                                      'setone baber',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Canada, bfg hkjl,',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ])),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
