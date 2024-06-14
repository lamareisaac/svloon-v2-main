import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svloon2/features/explorer/presentation/cubit/favoris/get_favoris_cubit.dart';
import 'package:svloon2/features/global/common/common.dart';

import 'favoris_item.dart';

class ProfileProFavorisPage extends StatefulWidget {
  const ProfileProFavorisPage({super.key});

  @override
  State<ProfileProFavorisPage> createState() => _ProfileProFavorisPageState();
}

class _ProfileProFavorisPageState extends State<ProfileProFavorisPage> {
  
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: Colors.white.withOpacity(0.97),
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              toolbarHeight: 100,
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Column(
                children: [
                  const Text(
                    'Favoris',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      autofocus: false,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Que cherchez vous ?",
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          fillColor: Colors.transparent,
                          filled: true),
                    ),
                  ),
                ],
              ),
              bottom: TabBar(
                padding: const EdgeInsets.all(3),
                // isScrollable: true,
                indicatorColor: Colors.black,
                indicatorWeight: 5.0,
                labelColor: Colors.black,
                labelStyle: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'Poppins',
                ),
                onTap: (int) {
                  setState(() {
                    index = int;
                  });
                },
                tabs: [
                  const Tab(
                    text: 'Salons',
                  ),
                  const Tab(
                    text: 'Artiste',
                  ),
                ],
              ),
            ),
            body: Builder(builder: (context) {
              return const TabBarView(
                  children: [FavorisSalon(), FavorisArtist()]);
            })));
  }
}

class FavorisSalon extends StatefulWidget {
  const FavorisSalon({super.key});

  @override
  State<FavorisSalon> createState() => _FavorisSalonState();
}

class _FavorisSalonState extends State<FavorisSalon> {
  @override
  void initState() {
    // TODO: implement initState
            BlocProvider.of<GetFavorisCubit>(context).getSalonFavorite();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavorisCubit, SalonFavorisState>(
      builder: (context, state) {
        if (state is SalonFavorisSuccess) {
          return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: state.favoris.length,
          itemBuilder: (_, i) {
            return FavorisItem(salonFavoris: state.favoris[i]);
          },
        );
        }
        else if (state is SalonFavorisLoading){
          return Center(child: CircularProgressIndicator.adaptive(),);
        }

        else{
          return Center(child: CircularProgressIndicator.adaptive());
        }
        
      },
    );
  }
}
class FavorisArtist extends StatefulWidget {
  const FavorisArtist({super.key});

  @override
  State<FavorisArtist> createState() => _FavorisArtistState();
}

class _FavorisArtistState extends State<FavorisArtist> {
  @override
  void initState() {
    // TODO: implement initState
            BlocProvider.of<GetFavorisCubit>(context).getArtistFavorite();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavorisCubit, SalonFavorisState>(
      builder: (context, state) {
        if (state is ArtistFavorisSuccess) {
          return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: state.favoris.length,
          itemBuilder: (_, i) {
            return FavorisItem(salonFavoris: state.favoris[i]);
          },
        );
        }
        else if (state is ArtistFavorisFailed) {
          toast(state.error);
          return Center(child: CircularProgressIndicator.adaptive(),);
        }
        
        else{
          return Center(child: CircularProgressIndicator.adaptive(),);
        }
      },
    );
  }
}
