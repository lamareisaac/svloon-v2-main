import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:svloon2/features/explorer/presentation/pages/artists/profile/profile_pro/view/artist/profile_pro_artiste_page%20.dart';
import '../../../../../../../style.dart';
import '../../cubit/artistes/artistes_cubit.dart';

class ArtisteCarousel extends StatelessWidget {
  const ArtisteCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Artistes",
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
        BlocBuilder<ArtistesCubit, ArtistesState>(
          builder: (context, state) {
            if (state is ArtistesLoading) {
              return Shimmer.fromColors(
                  baseColor: Colors.grey.shade400,
                  highlightColor: Colors.grey.shade200,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 10, 8, 8),
                      child: Container(
                        height: 150,
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
            } else if (state is ArtistesSuccess) {
              if (state.artistes.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 80, 8, 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.62,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(234, 234, 234, 1),
                      ),
                      child: const Center(
                        child: Text(
                          "Aucun artiste trouvé",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                );
              }
              return Container(
                padding: EdgeInsets.only(top: 12, bottom: 10),
                child: CarouselSlider.builder(
                  itemCount: state.artistes.length,
                  options: CarouselOptions(
                    viewportFraction: 0.62,
                    aspectRatio: 2.5,
                    autoPlay: true,
                    autoPlayCurve: Curves.easeIn,
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final item = state.artistes[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileUProArtistePage(
                                      artist: item,
                                    )));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.55,
                        height: 162,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(item.artist.images.isEmpty
                                ? "https://i0.wp.com/nigoun.fr/wp-content/uploads/2022/04/placeholder.png?ssl=1"
                                : item.artist.images[0]),
                            fit: BoxFit.cover,
                          ),
                          color: Style.cameraPageBackground,
                        ),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Center(
                                    child: Text(
                                      "${item.name}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 15,
                              bottom: 15,
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  progressIndicatorBuilder:
                                      (context, url, progress) => Center(
                                          child: CircularProgressIndicator
                                              .adaptive(
                                                  value: progress.progress)),
                                  imageUrl: item.photoUrl,
                                  fit: BoxFit.cover,
                                  width: 45,
                                  height: 45,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (state is ArtistesError) {
              return Center(
                child: Text(state.error),
              );
            } else {
              return Center(
                child: Text('test'),
              );
            }
          },
        )
      ],
    );
  }
}
