import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../user/presentation/cubit/auth/auth_cubit.dart';
import '../../../../../../../user/presentation/cubit/credential/credential_cubit.dart';
import '../../../../../../../user/presentation/pages/loading/loading_page.dart';
import 'profil_account_page.dart';

class ProfileViewUserPage extends StatefulWidget {
  const ProfileViewUserPage({super.key});

  @override
  State<ProfileViewUserPage> createState() => _ProfileViewUserPageState();
}

class _ProfileViewUserPageState extends State<ProfileViewUserPage> {
  @override
  Widget build(BuildContext context) {
      int index = 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        actions: [
          IconButton(
            onPressed: () => _signOut(),
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            )),
        ]
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Column(
              children: [
                Center(
          child: const Text(
            "Profile",
            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 20,),
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/315.jpg",
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(height: 10,),
                Text("changer")
              ],
            ),
          ),
          SizedBox(height: 20,),
           DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
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
                        Tab( 
                          text: 'Compte',
                        ),
                        Tab(
                          text: 'Information avancée',
                        ),
                        Tab(
                          text: 'Sécurité',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              index == 0
                  ? ProfileUserPageAccount()
                  : index == 1
                      ? ProfileUserPageAccount()
                      : ProfileUserPageAccount(),
        ]),
      ),
    );
  }
  void _signOut(){

    BlocProvider.of<AuthCubit>(context).loggedOut();
   Navigator.pushAndRemoveUntil(
                        (context),
                        MaterialPageRoute(
                            builder: (context) => Loading()),
                        (route) => true);
  }
}

