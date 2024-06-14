import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:svloon2/features/explorer/presentation/pages/artists/profile/profile_pro/view/artist/profile_pro_artiste_page%20.dart';


class ReservationListofPro extends StatefulWidget {
  const ReservationListofPro({super.key});

  @override
  State<ReservationListofPro> createState() => _ReservationListofProState();
}

class _ReservationListofProState extends State<ReservationListofPro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            SizedBox(
              height: 85,
              child: DefaultTabController(
                  length: 4,
                  child: SafeArea(
                      child: Scaffold(
                    // backgroundColor: Colors.white,
                    appBar: AppBar(
                      toolbarHeight: 10,
                      backgroundColor: Colors.white,
                      automaticallyImplyLeading: false,
                      bottom: TabBar(
                        padding: const EdgeInsets.all(3),
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
                          Tab(text: 'Tous'),
                          Tab(text: 'Babershop'),
                          Tab(text: 'Salon de coiffure'),
                          Tab(text: 'Tattooshop'),
                        ],
                      ),
                      elevation: 0,
                    ),
                  ))),
            ),
            SizedBox(
              height: 50,
              child: TextFormField(
                autofocus: false,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(20)),
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(20)),
                    fillColor: Color.fromRGBO(234, 234, 234, 1),
                    filled: true),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _buildCarouselItem(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselItem(
    BuildContext context,
  ) {
    //  final _byteImage = const Base64Decoder().convert(offer.image);
    return Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        child: GestureDetector(
          onTap: () {
            //generate code for loop
            // Navigator.pushAndRemoveUntil(
            //     (context),
            //     MaterialPageRoute(
            //       builder: (context) => ProfileUProArtistePage(),
            //     ),
            //     (route) => true);
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
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
