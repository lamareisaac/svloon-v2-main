import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svloon2/features/explorer/presentation/cubit/favoris/get_favoris_cubit.dart';

import 'package:svloon2/features/widget/web_view_widget.dart';

import '../../../../../../../Location/presentation/pages/location_save_page.dart';
import '../../../../../../../user/presentation/pages/notification/view/notification_page.dart';
import '../../../../../../../user/presentation/pages/paiement/paiment_card_list/view/paiment_card_list.dart';
import '../../../../../../../reservation/presentation/pages/reservation/reservation_history/view/reservation_history_page.dart';
  import '../../profile_pro_favoris/view/profile_pro_favoris_page.dart';
import 'profil_account_page.dart';
import 'profile_user_view_page.dart';

class ProfileUserPage extends StatefulWidget {
  const ProfileUserPage({super.key});

  @override
  State<ProfileUserPage> createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends State<ProfileUserPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            // appBar: AppBar(
            //   elevation: 0,
            //   backgroundColor: Colors.white,
            //   automaticallyImplyLeading: false,
            // ),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: ()=> Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ProfileViewUserPage())),
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.19,
                          padding: const EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/filtre_profile.png"),
                                fit: BoxFit.cover,
                              ),
                              color: Color(0xFF442D19),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   const Padding(
                                     padding: EdgeInsets.only(top:10, left: 10),
                                     child: Text('Profile',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Poppins',
                                            fontSize: 15)),
                                   ),
                                  SizedBox(height: 20,),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20, right: 20),
                                      child: Row(children: [
                                        SizedBox(
                                          
                                          width:
                                              MediaQuery.of(context).size.width - 200,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text('Jean setone ',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      overflow: TextOverflow.fade,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: 'Poppins',
                                                      fontSize: 24)),
                                                      SizedBox(height: 10,),
                                              Row(children: const [
                                                Text(
                                                  'Modifier',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(143, 144, 166, 1),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                 Icon(
                                                  Icons.navigate_next_outlined,
                                                  size: 20,
                                                  color: Colors.grey,
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                        
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                              ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/315.jpg",
                                      fit: BoxFit.cover,
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(children: [
                      _buildListTileItem(Icons.notifications, 'Notification',
                          const NotificationPage()),
                      _buildListTileItem(
                          Icons.calendar_month_rounded,
                          'Historique des reservations ',
                          const ReservationHistoryPage()),
                      _buildListTileItem(Icons.favorite, 'Favoris',
                          const ProfileProFavorisPage()),
                      _buildListTileItem(Icons.credit_card,
                          'Methode de paiement', const PaiementCardList()),
                      _buildListTileItem(Icons.pin_drop_outlined,
                          'Emplacement enregistré', const LocationSavePage()),
                      _buildListTileItem(
                          Icons.group_add,
                          'inivitez un ami',
                          WebViewWidgetPage(
                              title: 'google', selectedUrl: 'www.google.com')),
                      _buildListTileItem(
                          Icons.badge,
                          'Travailler avec Saloon pro',
                          WebViewWidgetPage(
                              title: 'google', selectedUrl: 'www.google.com')),
                      _buildListTileItem(
                          Icons.question_mark_rounded,
                          'Faq',
                          WebViewWidgetPage(
                              title: 'google', selectedUrl: 'www.google.com')),
                      _buildListTileItem(
                          Icons.policy,
                          'Confidentialé',
                          WebViewWidgetPage(
                              title: 'google', selectedUrl: 'www.google.com')),
                      _buildListTileItem(
                          Icons.info_rounded,
                          'A propos',
                          WebViewWidgetPage(
                              title: 'google', selectedUrl: 'www.google.com')),
                      _buildListTileItem(
                          Icons.logout,
                          'Déconnexion',
                          WebViewWidgetPage(
                              title: 'google', selectedUrl: 'www.google.com'))
                    ]),
                  ]),
            ))));
  }

  Widget _buildListTileItem(IconData icon, String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.only(top: 13, bottom: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
          ),
          leading: Icon(
            icon,
            size: 30,
            color: Colors.black,
          ),
          trailing: const Icon(
            Icons.navigate_next_outlined,
            size: 26,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
