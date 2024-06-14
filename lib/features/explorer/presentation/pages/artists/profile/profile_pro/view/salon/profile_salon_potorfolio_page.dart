import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';

class ProfileProPortofolioPage extends StatefulWidget {
  List<dynamic> porfolio;

  ProfileProPortofolioPage({Key? key, required this.porfolio})
      : super(key: key);

  @override
  State<ProfileProPortofolioPage> createState() =>
      _ProfileProPortofolioPageState();
}

class _ProfileProPortofolioPageState extends State<ProfileProPortofolioPage> {
  final List<String> _items = [];

  @override
  Widget build(BuildContext context) {
    return widget.porfolio.isNotEmpty ? SingleChildScrollView(
            child: MasonryView(
              listOfItem: _items,
              numberOfColumn: 2,
              itemBuilder: (context) {
                // Utilisez Image.network pour afficher l'image
                return CachedNetworkImage(
                  imageUrl: context,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) => Center(
                      child: CircularProgressIndicator.adaptive(
                          value: progress.progress)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                );
              },
            ),
          ) : Center(
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
                      "Aucun portfolio trouvé",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            );
    
   
  }
}
