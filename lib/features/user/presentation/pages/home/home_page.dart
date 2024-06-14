import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../explorer/presentation/pages/home/explorer_home.dart';
import '../../../../fast_service_page/presentation/pages/fast_service_page.dart';
import '../message/message_list/view/messsage_list_page.dart';
import '../../../../explorer/presentation/pages/artists/profile/profile_user/view/profile_user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _page = <Widget>[
    FastservicePage(), // HousePlacePage(),
    ExplorerHome(),
    // ReservationHistoryPage(),
    // SearchTabViewPage(),
    MessageListPage(),
    ProfileUserPage()
  ];
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            // appBar: _buildAppBar(context),
            extendBodyBehindAppBar: true,

            bottomNavigationBar: SafeArea(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding:
                      EdgeInsets.only(bottom: 10, top: 25, right: 8, left: 8),
                  decoration: BoxDecoration(
                      color: Colors
                          .transparent, // Définir la couleur de fond comme transparente
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.5), width: 1)),
                  child: NavigationBarTheme(
                    data: const NavigationBarThemeData(
                      indicatorColor: Colors.transparent,
                    ),
                    child: NavigationBar(
                      selectedIndex: _selectedIndex,
                      onDestinationSelected: (index) {
                        setState(() {
                          this._selectedIndex = index;
                        });
                      },
                      height: MediaQuery.of(context).size.height * 0.04,
                      backgroundColor: Colors
                          .transparent, // Définir le fond de la barre de navigation comme transparent
                      destinations: [
                        NavigationDestination(
                            icon: Image.asset('assets/images/home_u.png'),
                            selectedIcon: Image.asset('assets/images/home.png'),
                            label: ""),
                        NavigationDestination(
                            icon: Image.asset('assets/images/search.png'),
                            selectedIcon:
                                Image.asset('assets/images/search_u.png'),
                            label: ""),
                        NavigationDestination(
                            icon: Image.asset(
                              'assets/images/messenger.png',
                            ),
                            selectedIcon:
                                Image.asset('assets/images/messenger_u.png'),
                            label: ""),
                        NavigationDestination(
                            icon: Image.asset('assets/images/user.png'),
                            selectedIcon:
                                Image.asset('assets/images/user_u.png'),
                            label: ""),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            body: _page.elementAt(_selectedIndex),
          )),
    );
  }
}

AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    // title: SvgPicture.asset(
    //   Assets.images.logoWhite.path,
    //   fit: BoxFit.fitHeight,
    // ),
    actions: [
      // _buildTicketButton(context),
      // const BalanceToogle(),
    ],
  );
}
