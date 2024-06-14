import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svloon2/features/fast_service_page/presentation/cubit/get_service_cubit.dart';

import '../../../../fast_service_page/presentation/pages/fast_service_search_page.dart';
import '../../../../widget/selection_option.dart';
import '../../../../widget/toggle_button.dart';
import '../../cubit/artistes/artistes_cubit.dart';
import '../../cubit/salon_cubit.dart';
import '../explorer_page.dart';
import '../map/map.dart';

class ExplorerHome extends StatefulWidget {
  const ExplorerHome({super.key});

  @override
  State<ExplorerHome> createState() => _ExplorerHomeState();
}

class _ExplorerHomeState extends State<ExplorerHome> {
 final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

 int index = 0;
 int selected = 1;
  @override
  void initState() {
    // TODO: implement initState

    BlocProvider.of<SalonCubit>(context).getSalons();
    BlocProvider.of<ArtistesCubit>(context).getArtistes();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: Colors.transparent,

              // Status bar brightness (optional)
              statusBarIconBrightness:
                  Brightness.dark, // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
            toolbarHeight: 0,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Stack(
            children: [
              ExplorerPage(),
              MyMap(),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white.withOpacity(0.07),
                  ],
                )),
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 0, right: 10),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const FastServiceSearchPage(),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Text(
                                        "Chez moi",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/pos.png",
                                            width: 13,
                                            height: 13,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            width:
                                                150, // Limitez la largeur du conteneur pour le débordement de texte
                                            child: Text(
                                              "55 Avenue du Mont-Royal O",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                                fontSize: 13,
                                              ),
                                              overflow: TextOverflow
                                                  .ellipsis, // Cela ajoute des points de suspension en cas de débordement
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                            "assets/images/dropdown.png",
                                            width: 9,
                                            height: 9,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          ToogleButton(index: 1),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _searchController,
                      onChanged: (value) {
                        if (_debounce?.isActive ?? false) _debounce!.cancel();
                        _debounce =
                            Timer(const Duration(milliseconds: 1000), () {
                          BlocProvider.of<SalonCubit>(context)
                              .searchSalonByName(_searchController.text);

                          if (value.isNotEmpty) {
                            //places api
                          } else {
                            //clear out the results
                          }
                        });
                      },
                      autofocus: false,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        suffixIcon: Image.asset(
                          "assets/images/filtre.png",
                          scale: 3,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(50)),
                        label: Text(
                          "Que cherchez vous ?",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        labelStyle: const TextStyle(color: Colors.black),
                        contentPadding: const EdgeInsets.only(
                            left: 20, top: 10, bottom: 10),
                        border: InputBorder.none,
                        focusColor: Colors.black,
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    BlocBuilder<GetServiceCubit, GetServiceState>(
                      builder: (context, state) {
                        if (state is GetServiceSuccess) {
                          return Row(
                            children: [
                              for (int i = 0; i < state.services.length; i++)
                                SelectionButton(
                                    text: state.services[i].label, index: i),
                            ],
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
              ExplorerPage(),
            ],
          )),
    );
  }

}
