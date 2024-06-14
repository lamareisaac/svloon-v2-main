import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:svloon2/features/explorer/data/model/salon_favoris_model.dart';

class FavorisItem extends StatelessWidget {
  dynamic salonFavoris;
   FavorisItem({super.key, required this.salonFavoris});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
                height: MediaQuery.of(context).size.height * 0.14,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     ClipOval(
                                child: CachedNetworkImage(
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                  progressIndicatorBuilder: (context, url, progress) => Center(child: CircularProgressIndicator.adaptive(value: progress.progress)),
                                  imageUrl:
                                      salonFavoris.photoUrl,
                                  fit: BoxFit.cover,
                                  width: 45,
                                  height: 45,
                                ),
                              ),
                      Container(
                        
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                salonFavoris.name,
                                style: TextStyle(
                                  color: Colors.black,
                                  
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                               Text(
                                'Travail de  de 8h à 19h',
                                style: TextStyle(
                                  color: Colors.black,
                                  overflow: TextOverflow.clip,
                                  fontSize: 15,
                                ),
                              ),
                               Text(
                                'Canade, Montreal',
                                style: TextStyle(
                                  color: Colors.black,
                                  overflow: TextOverflow.clip,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                       Container(
                        padding: EdgeInsets.all(15),
                       decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
                        shape: BoxShape.circle
                       ),
                        
                          child: Icon(Icons.favorite, color: Colors.red,)
                          ),
                          
                    ],
                  ),
                ),
              ),
    );
  }
}