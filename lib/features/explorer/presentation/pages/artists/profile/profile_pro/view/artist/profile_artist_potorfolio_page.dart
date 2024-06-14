import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:svloon2/features/explorer/data/model/artists_model.dart';

class ProfileProArtistPortefolio extends StatefulWidget {
  Artist artist;

  ProfileProArtistPortefolio({Key? key, required this.artist})
      : super(key: key);

  @override
  State<ProfileProArtistPortefolio> createState() =>
      _ProfileProArtistPortefolioState();
}

class _ProfileProArtistPortefolioState
    extends State<ProfileProArtistPortefolio> {
  final List<String> _items = [];

  @override
  Widget build(BuildContext context) {
    _items.clear();

    // Remplissez la liste _items avec les URL des images du portfolio
    if (widget.artist.portfolio.isNotEmpty) {
      for (var portfolioItem in widget.artist.portfolio) {
        _items.add(portfolioItem['imageUrl']); // où chaque élément est de type Portfolio

      }
    }
    return widget.artist.portfolio.isNotEmpty
        ? SingleChildScrollView(
            child: MasonryView(
              listOfItem: _items,
              numberOfColumn: 2,
              itemBuilder: (context) {
                // Utilisez Image.network pour afficher l'image
                return CachedNetworkImage(
                  imageUrl: context,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) =>
                      CircularProgressIndicator.adaptive(
                          value: progress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                );
              },
            ),
          )
        : Padding(
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
                                  "Aucun portfolio trouvé",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          );
  }
}
