import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../style.dart';
import '../artists/profile/profile_pro/view/salon/profile_pro_salon_page.dart';
import '../../cubit/get_single_salon_cubit.dart';
import '../../cubit/salon_cubit.dart';

class SalonCarousel extends StatelessWidget {
  const SalonCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      const Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Salons",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                  overflow: TextOverflow.fade,
                  softWrap: true),
              Text("Plus",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.fade,
                  softWrap: true),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 0, bottom: 0),
          child: BlocBuilder<SalonCubit, SalonState>(
            builder: (context, state) {
              if (state is GetSalonLoading) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade400,
                  highlightColor: Colors.grey.shade200,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 10, 8, 8),
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.66,
                        margin: const EdgeInsets.only(top: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(234, 234, 234, 1),
                        ),
                      ),
                    ),
                  ),
                );
              } else if (state is GetSalonSuccess) {
                if (state.salon.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 10, 8, 8),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromRGBO(234, 234, 234, 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Text(
                            "Aucun salon trouvé",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return CarouselSlider.builder(
                  itemCount: state.salon.length,
                  itemBuilder: (context, index, i) {
                    var item = state.salon[index].salon;
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<GetSingleSalonCubit>(context)
                            .getSingleSalon(item.id);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileUProSalonPage(
                                      salon: state.salon[index].salon,
                                    ))
                            );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.66,
                        margin: const EdgeInsets.only(top: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(item.pictures.isEmpty
                                ? "https://i0.wp.com/nigoun.fr/wp-content/uploads/2022/04/placeholder.png?ssl=1"
                                : item.pictures[0]),
                            fit: BoxFit.cover,
                          ),
                          color: Style.cameraPageBackground,
                        ),
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: const BorderRadius.vertical(
                                    bottom: Radius.circular(10)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, bottom: 15, right: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${item.name}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "${item.coverPicture ?? "https://static.vecteezy.com/system/resources/previews/008/442/086/non_2x/illustration-of-human-icon-user-symbol-icon-modern-design-on-blank-background-free-vector.jpg"}",
                                      fit: BoxFit.cover,
                                      width: 70,
                                      height: 70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                      viewportFraction: 0.66,
                      enlargeCenterPage: true,
                      aspectRatio: 2,
                      autoPlay: false,
                      autoPlayCurve: Curves.easeIn,
                      enableInfiniteScroll: false),
                );
              }
              return const Center(
                child: Text(
                  "Aucun salon trouvé",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
