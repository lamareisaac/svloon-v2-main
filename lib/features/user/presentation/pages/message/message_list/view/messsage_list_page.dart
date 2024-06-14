import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../message_detail/view/message_detail_page.dart';

class MessageListPage extends StatefulWidget {
  const MessageListPage({super.key});

  @override
  State<MessageListPage> createState() => _MessageListPageState();
}

class _MessageListPageState extends State<MessageListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
   
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10),
                  child: const Text(
                    'Message',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        fontSize: 25),
                    textAlign: TextAlign.left,
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                  Icons.notifications,
                  size: 30,
                  color: Colors.black,
                              )),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MessageDetailPage()),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/315.jpg",
                        fit: BoxFit.cover,
                        width: 60,
                        height: 60,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Container(
                            margin: EdgeInsets.only(top: 0),
                              constraints: const BoxConstraints(
                                  maxWidth: 800 < 321 ? 150 : 185,
                                  ),
                              child: const Text(
                                'Hilligo ',
                                style: TextStyle(
                                    color: Colors.black,
                                                        fontFamily: 'Poppins',

                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                              )),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                             constraints: const BoxConstraints(
                                  maxWidth: 800 < 321 ? 80 : 120,
                                  ),
                              child: const Text(
                                'Salut, je suis disponible pour votre demande',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              )),
                        ])),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, right: 18),
                      child: Text(
                        '23 dec ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
